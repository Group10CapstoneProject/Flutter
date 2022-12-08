import 'package:capstone_alterra_flutter/model/detail_transaction_model.dart';
import 'package:capstone_alterra_flutter/model/payment_method_model.dart';
import 'package:capstone_alterra_flutter/model/transaction_model.dart';
import 'package:capstone_alterra_flutter/screen/transaction/payment_confirmation_screen.dart';
import 'package:capstone_alterra_flutter/styles/theme.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

ValueNotifier<int?> _indexPaymentChoosen = ValueNotifier(null);

class TransactionDetailScreen extends StatefulWidget {
  const TransactionDetailScreen({super.key, required this.transactionModel});

  final TransactionModel transactionModel;

  @override
  State<TransactionDetailScreen> createState() => _TransactionDetailScreenState();
}

class _TransactionDetailScreenState extends State<TransactionDetailScreen> {

  List<PaymentMethodModel> listPayment = [
    PaymentMethodModel(id: 1, iconLink: 'OVO.png', name: 'OVO', paymentNumber: '082213652536'),
    PaymentMethodModel(id: 2, iconLink: 'crown.png', name: 'My Membership'),
  ];

  @override
  void initState() {
    _indexPaymentChoosen.value = null;
    super.initState();
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
        title: Text('Rincian Transaksi', style: kHeading6.apply(color: blackLight),),
      ),
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (p0, p1Constraint) {
          return SingleChildScrollView(
            child: Container(
              constraints: BoxConstraints(
                minHeight: p1Constraint.maxHeight
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        _itemCardWidget(widget.transactionModel),
                        _detailOrderAndPayment(widget.transactionModel),
                        ValueListenableBuilder(
                          valueListenable: _indexPaymentChoosen,
                          builder: (context, value, child) {
                            return (_indexPaymentChoosen.value != null) ? 
                              _paymentMethodWidget(context, listPayment) : 
                              const SizedBox();
                          },
                        )
                      ],
                    ),
                    ValueListenableBuilder(
                      valueListenable: _indexPaymentChoosen,
                      builder: (context, _, child) {
                        return _TwoBottomButtonWidget(
                          transactionModel: widget.transactionModel,
                          listPayment: listPayment
                        );
                      }
                    )
                  ],
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}








///A Widget that contain upper part of transaction detail that has card of an item of transaction
Widget _itemCardWidget(TransactionModel transactionModel){

  return SizedBox(
    width: double.infinity,
    child: Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 16),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Color(0x1A000000,), offset: Offset(2, 4), blurRadius: 12)
        ],
      ),

      ///Text of item title, item subtitle, and total price
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  transactionModel.title, 
                  style: kSubtitle1,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                )
              ),
              (transactionModel.subTitle != null) ? 
                Text(transactionModel.subTitle!, style: kCaption.apply(color: transactionModel.subTitleColor)) : 
                const SizedBox(),
            ],
          ),
          const SizedBox(height: 20,),
          Text(transactionModel.totalPriceFormatted, style: kSubtitle1.copyWith(fontWeight: semiBold, color: blackLightest),)
        ],
      ),
    ),
  );
}









///A widget that contain detail order and payment order at the bottom of transaction detail screen
Widget _detailOrderAndPayment(TransactionModel transactionModel){

  ///A widget that return a row of every item in list of detail transaction
  Widget itemDetailOrder(DetailTransactionModel model){

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                model.icon,
                const SizedBox(width: 8,),
                Expanded(child: Text(model.title, style: kSubtitle2,))
              ],
            ),
          ),
          Text(model.subTitle, style: kSubtitle2.copyWith(fontWeight: semiBold),)
        ],
      ),
    );
  }


  ///return of _detailOrderAndPayment
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 16),
    decoration: BoxDecoration(
      border: Border(top: BorderSide(color: whiteDarker))
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        ///Detail Order part
        Text('Detail Pemesanan', style: kSubtitle1,),
        const SizedBox(height: 8,),
        
        ///List of detail order(DetailTransactionModel)
        Column(
          children: [
            for(DetailTransactionModel i in transactionModel.listDetailTransaction)
              itemDetailOrder(i)
          ],
        ),

        const SizedBox(height: 8,),
        Container(color: whiteDarker, height: 1,),
        const SizedBox(height: 16,),


        ///Detail Payment part
        Text('Rician Pembayaran', style: kSubtitle1,),
        const SizedBox(height: 16,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(child: Text('Harga item', style: kBody2,)),
            Text(
              '${transactionModel.priceFormatted}${(transactionModel.quantity > 1) ? ' x ${transactionModel.quantity}' : ''}' ,
              style: kSubtitle2.copyWith(fontWeight: semiBold)
            ),
          ],
        ),
        const SizedBox(height: 16,),
        Text('Discount', style: kBody2,),
        const SizedBox(height: 8,),
        DottedLine(dashColor: whiteDarker,),
        const SizedBox(height: 8,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Total Bayar', style: kBody2,),
            Text(transactionModel.totalPriceFormatted, style: kSubtitle2.copyWith(fontWeight: semiBold),)
          ],
        ),
      ],
    ),
  );
}








///A widget that contain a method of payment that was picked by user
Widget _paymentMethodWidget(BuildContext context, List<PaymentMethodModel> listPayment){

  PaymentMethodModel model = listPayment[_indexPaymentChoosen.value!];

  return Container(
    padding: const EdgeInsets.symmetric(vertical: 16),
    decoration: BoxDecoration(
      border: Border(
        top: BorderSide(color: whiteDarker)
      )
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Metode Pembayaranmu', style: kSubtitle1,),
        const SizedBox(height: 16,),
        Container(
          height: 60,
          width: double.infinity,
          margin: const EdgeInsets.only(bottom: 8),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: whiteDarker)
          ),
          child: Row(
            children: [
              Image(
                image: AssetImage('assets/transaction_page/${model.iconLink}'), 
                height: 30,
                width: 30,
              ),
              const SizedBox(width: 8,),
              Expanded(
                child: Text(model.name, style: kBody1, maxLines: 1, overflow: TextOverflow.ellipsis,)
              ),
            ],
          ),
        ),
        const SizedBox(height: 16,),
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: (){
              _showPaymentMethodBottomSheet(context: context, listPayment: listPayment);
            },
            style: const ButtonStyle(overlayColor: MaterialStatePropertyAll(Colors.transparent)),
            child: Text('Ubah pembayaran', style: kSubtitle2.copyWith(color: infoBase, decoration: TextDecoration.underline), )
          ),
        )
      ],
    ),
  );
}










///A widget that contain two button at the bottom of transaction detail screen
class _TwoBottomButtonWidget extends StatefulWidget {
  const _TwoBottomButtonWidget({
    required this.listPayment,
    required this.transactionModel,
  });

  final TransactionModel transactionModel;
  final List<PaymentMethodModel> listPayment;

  @override
  State<_TwoBottomButtonWidget> createState() => _TwoBottomButtonWidgetState();
}

class _TwoBottomButtonWidgetState extends State<_TwoBottomButtonWidget> {
  @override
  Widget build(BuildContext context) {

    return SizedBox(
      child: Column(
        children: [
          const SizedBox(height: 16,),

          ///Top button
          SizedBox(
            height: 50,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: (){
                (_indexPaymentChoosen.value == null) ? 
                  _showPaymentMethodBottomSheet(
                    context: context,
                    listPayment: widget.listPayment,
                  ) :
                  Navigator.push(
                    context, 
                    MaterialPageRoute(
                      builder: (context) => PaymentConfirmationScreen(
                        transactionModel: widget.transactionModel,
                        paymentMethodModel: widget.listPayment[_indexPaymentChoosen.value!],
                      ),
                    )
                  );
              }, 
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryBase,
                foregroundColor: Colors.white,
                elevation: 0
              ),
              child: Text(
                (_indexPaymentChoosen.value == null) ? 'PILIH METODE PEMBAYARAN' : 'BAYAR',
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














///A method to display bottom sheet for payment method input
void _showPaymentMethodBottomSheet({
  required BuildContext context, 
  required List<PaymentMethodModel> listPayment,
}) async{

  ValueNotifier<int?> groupValue = ValueNotifier(_indexPaymentChoosen.value);

  int? tempIndex = await showModalBottomSheet(
    context: context, 
    backgroundColor: Colors.transparent,
    builder: (context) => Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        color: Colors.white
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Pilih Metode Pembayaran', style: kHeading6,),
                  IconButton(
                    onPressed: (){
                      Navigator.pop(context);
                    }, 
                    icon: const Icon(Icons.close)
                  )
                ],
              ),
              const SizedBox(height: 16,),

              ///For every payment method in list payment
              for(int i = 0; i < listPayment.length; i++)
                Container(
                  height: 60,
                  width: double.infinity,
                  margin: const EdgeInsets.only(bottom: 8),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: whiteDarker)
                  ),
                  child: Row(
                    children: [
                      Image(
                        image: AssetImage('assets/transaction_page/${listPayment[i].iconLink}'), 
                        height: 30,
                        width: 30,
                      ),
                      const SizedBox(width: 8,),
                      Expanded(
                        child: Text(listPayment[i].name, style: kBody1, maxLines: 1, overflow: TextOverflow.ellipsis,)
                      ),
                      ValueListenableBuilder(
                        valueListenable: groupValue,
                        builder: (context, _, child) {
                          return Radio<int>(
                            value: i, 
                            groupValue: groupValue.value, 
                            onChanged: (value) {
                              groupValue.value = i;
                            },
                          );
                        }
                      )
                    ],
                  ),
                )
            ],
          ),

          ///Button Apply
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: (){
                Navigator.pop(context, groupValue.value);
              }, 
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryBase,
                foregroundColor: Colors.white,
                elevation: 0,
              ),
              child: Text('TERAPKAN', style: kButton,)
            ),
          )
        ],
      ),
    ),
  );
  (tempIndex != null)? _indexPaymentChoosen.value = tempIndex : null;
}