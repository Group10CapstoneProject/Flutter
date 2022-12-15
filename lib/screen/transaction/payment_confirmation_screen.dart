import 'dart:io';

import 'package:capstone_alterra_flutter/model/payment_method_model.dart';
import 'package:capstone_alterra_flutter/model/transaction_model.dart';
import 'package:capstone_alterra_flutter/provider/payment_confirmation_provider.dart';
import 'package:capstone_alterra_flutter/screen/main/main_screen.dart';
import 'package:capstone_alterra_flutter/styles/theme.dart';
import 'package:capstone_alterra_flutter/widget/circular_loading.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

ValueNotifier<File?> _file = ValueNotifier(null);

class PaymentConfirmationScreen extends StatefulWidget {
  const PaymentConfirmationScreen({
    super.key, 
    required this.bookingId,
    required this.transactionModel, 
    required this.paymentMethodModel
  });

  final int bookingId;
  final TransactionModel transactionModel;
  final PaymentMethodModel paymentMethodModel;

  @override
  State<PaymentConfirmationScreen> createState() => _PaymentConfirmationScreenState();
}

class _PaymentConfirmationScreenState extends State<PaymentConfirmationScreen> {

  @override
  void initState() {
    context.read<PaymentConfirmationProvider>().isLoading = false;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _file.value = null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        title: Text('Konfirmasi Pembayaran', style: kHeading6.apply(color: blackLight),),
      ),
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          LayoutBuilder(
            builder: (p0, p1Constraint) {
              return SingleChildScrollView(
                child: Container(
                  constraints: BoxConstraints(
                    minHeight: p1Constraint.maxHeight
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          _totalPembayaranWidget(widget.transactionModel),
                          _fourStepWidget(widget.paymentMethodModel),
                          _filePickerButton(),
                        ],
                      ),
                      _TwoBottomButtonWidget(
                        bookingId: widget.bookingId,
                        transactionModel: widget.transactionModel,
                        paymentMethodModel: widget.paymentMethodModel,
                      ),
                      
                    ],
                  ),
                ),
              );
            }
          ),
          Consumer<PaymentConfirmationProvider>(
            builder: (context, value, child){
              return (value.isLoading) ? const CircularLoading() : const SizedBox();
            },
          )
        ],
      ),
    );
  }
}











///A widget that contain total price at the top part of screen
Widget _totalPembayaranWidget(TransactionModel transactionModel){
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Total Pembayaran:', style: kBody2,),
        const SizedBox(height: 12,),
        Text(transactionModel.totalPriceFormatted, style: kHeading5.apply(color: primaryBase),),
        const SizedBox(height: 12,),
        Container(
          padding: const EdgeInsets.all(16),
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: warningLightest
          ),
          child: Text('Bayar pesanan sesuai jumlah diatas', style: kBody2.apply(color: warningDarker),),
        )
      ],
    ),
  );
}











///A widget that contain 4 step for payment
Widget _fourStepWidget(PaymentMethodModel paymentMethodModel){

  ///A widget that drawn as a circle container of the number of every step
  Widget numberWidget(int value){
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: whiteDarkest
      ),
      child: Text(value.toString(), style: kBody2.apply(color: Colors.white),),
    );
  }


  ///A widget that drawn as a container of every step
  Widget stepWidget(int value, String description){
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color: whiteDark,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(child: numberWidget(value)),
          Expanded(
            child: Container(
              constraints: const BoxConstraints(
                minHeight: 33
              ),
              alignment: Alignment.centerLeft,
              child: Text(
                description, 
                style: kBody2.apply(color: blackLightest),

              ),
            )
          )
        ],
      ),
    );
  }



  ///A return of _fourStepWidget()
  return Column(
    children: [
      
      Container(height: 1, color: whiteDarker,),
      ///step 1
      stepWidget(1, 'Transfer ke nomor ${paymentMethodModel.name} berikut ini:'),
      Container(height: 1, color: whiteDarker,),

      ///payment number detail
      Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Image(image: AssetImage('assets/transaction_page/${paymentMethodModel.iconLink}')),
                const SizedBox(width: 8,),
                Text(paymentMethodModel.name, style: kSubtitle2,)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(paymentMethodModel.paymentNumber!.toString(), style: kSubtitle1,),
                TextButton(
                  onPressed: (){}, 
                  child: Text('Salin', style: kBody1.apply(color: infoDark),)
                )
              ],
            )
          ],
        ),
      ),

      Container(height: 1, color: whiteDarker,),
      ///step 2
      stepWidget(2, 'Silakan upload bukti transfer Anda.'),

      ///step 3
      stepWidget(3, 'Demi keamanan transaksi, mohon untuk tidak membagikan bukti atau konfirmasi pembayaran pesanan kepada siapapun, selain mengunggahnya via aplikasi altagym.'),

      ///step 4
      stepWidget(4, 'Pembayaran anda akan dicek dalam 24 jam setelah bukti transfer diupload.'),
      Container(height: 1, color: whiteDarker,),
    ],
  );
}







///A widget that that contain a button to pick a file of image
Widget _filePickerButton(){

  return Container(
    padding: const EdgeInsets.all(32),
    alignment: Alignment.center,
    width: double.infinity,
    child: FittedBox(
      fit: BoxFit.none,
      child: GestureDetector(
        onTap: () async{
          FilePickerResult? result = await FilePicker.platform.pickFiles(
            type: FileType.custom,
            allowMultiple: false,
            allowedExtensions: ['jpg', 'jpeg', 'png'],
          );

          if (result != null){
            _file.value = File(result.files.single.path!);
            // print(_file.value!.path);
          }
        },
        child: ValueListenableBuilder(
          valueListenable: _file,
          builder: (context, value, child) {
            return DottedBorder(
              color: (_file.value == null) ? Colors.black : Colors.transparent,
              child: Container(
                width: 118,
                height: 86,
                decoration: (_file.value != null) ? 
                  BoxDecoration(
                    image: DecorationImage(image: FileImage(_file.value!), fit: BoxFit.cover)
                  ) : null,
                child: (_file.value == null) ? 
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.cloud_upload, color: blackLightest,),
                      const SizedBox(height: 8,),
                      Text('Sentuh untuk Upload', style: kBody2.apply(color: blackLightest), textAlign: TextAlign.center,)
                    ],
                  ) : null,
              ),
            );
          }
        ),
      ),
    ),
  );
}















///A widget that contain two button at the bottom of payment confirmation screen
class _TwoBottomButtonWidget extends StatefulWidget {
  const _TwoBottomButtonWidget({
    required this.transactionModel,
    required this.paymentMethodModel,
    required this.bookingId,
  });

  final int bookingId;
  final TransactionModel transactionModel;
  final PaymentMethodModel paymentMethodModel;

  @override
  State<_TwoBottomButtonWidget> createState() => _TwoBottomButtonWidgetState();
}

class _TwoBottomButtonWidgetState extends State<_TwoBottomButtonWidget> {
  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [

          ///Top button
          SizedBox(
            height: 50,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () async{
                if(_file.value == null){
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('File gambar belum dipilih')
                    )
                  );
                }
                else{
                  PaymentConfirmationProvider provider = Provider.of<PaymentConfirmationProvider>(context, listen: false);
                  bool paymentIsSuccess = await provider.uploadProofOfMembershipPayment(
                    bookingId: widget.bookingId, 
                    transactionType: widget.transactionModel.transactionType,
                    file: _file.value!,
                  );
                  if(paymentIsSuccess){
                    await showDialog(
                      context: context, 
                      builder: (context) => AlertDialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                        ),
                        content: Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text('Berhasil Diupload', style: kSubtitle1,),
                              const SizedBox(height: 16,),
                              Text('Pembayaran akan dikonfirmasi sebelum 24 jam', style: kBody2.apply(color: blackLightest),)
                            ],
                          ),
                        ),
                        actions: [
                          TextButton(
                            onPressed: (){
                              Navigator.pop(context,);
                            }, 
                            child: Text('OK', style: kSubtitle1.apply(color: primaryBase),)
                          )
                        ],
                      ),
                    );
                    if(mounted){
                      Navigator.pushAndRemoveUntil(
                        context, 
                        MaterialPageRoute(builder: (context) => const MainScreen(),), 
                        (route) => false
                      );
                    }
                  }
                  else if(mounted){
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Unexpected error')
                      )
                    );
                  }
                }
              }, 
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryBase,
                foregroundColor: Colors.white,
                elevation: 0
              ),
              child: Text(
                'KIRIMKAN',
                style: kButton,
              )
            ),
          ),

          ///Bottom button (Cancel Button)
          SizedBox(
            height: 50,
            width: double.infinity,
            child: TextButton(
              onPressed: () async{
                bool? isCancel = await showDialog(
                  context: context, 
                  builder: (context) => AlertDialog(
                    actionsPadding: const EdgeInsets.all(16),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset('assets/transaction_page/cancel_dialog.svg'),
                        Text('Batalkan Pesanan', style: kSubtitle1,),
                        const SizedBox(height: 16,),
                        Text(
                          'Kamu yakin ingin membatalkan pesanan ini?', 
                          style: kBody1.copyWith(color: const Color(0xFF9F9696)),
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                    actions: [
                      Row(
                        children: [

                          ///Cancel button
                          Expanded(
                            child: SizedBox(
                              height: 48,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  fixedSize: const MaterialStatePropertyAll(Size(double.infinity, double.infinity)),
                                  backgroundColor: const MaterialStatePropertyAll(Colors.white),
                                  elevation: const MaterialStatePropertyAll(0),
                                  side: MaterialStatePropertyAll(BorderSide(color: primaryBase)),
                                  shape: MaterialStatePropertyAll(
                                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
                                  )
                                ),
                                onPressed: (){
                                  Navigator.pop(context, false);
                                },
                                child: Text('BATAL', style: kButton.apply(color: primaryBase),),
                              ),
                            ),
                          ),

                          const SizedBox(width: 16,),

                          ///Yes button
                          Expanded(
                            child: SizedBox(
                              height: 48,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  fixedSize: const MaterialStatePropertyAll(Size(double.infinity, double.infinity)),
                                  backgroundColor: MaterialStatePropertyAll(primaryBase),
                                  elevation: const MaterialStatePropertyAll(0),
                                  shape: MaterialStatePropertyAll(
                                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
                                  )
                                ),
                                onPressed: () async{
                                  Navigator.pop(context, true);
                                },
                                child: Text('YA', style: kButton.apply(color: Colors.white),),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                );

                if(isCancel! && mounted){
                  Navigator.pop(context);
                }
              }, 
              style: ButtonStyle(
                foregroundColor: MaterialStatePropertyAll(dangerDarker),
                overlayColor: const MaterialStatePropertyAll(Colors.transparent),
              ),
              child: Text('BATALKAN PESANAN', style: kButton,)
            ),
          )
        ],
      ),
    );
  }
}