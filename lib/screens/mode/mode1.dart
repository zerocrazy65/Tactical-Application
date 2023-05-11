import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:tacticle_app/models/rule.dart';
import 'package:tacticle_app/screens/traningPage.dart';

import '../../models/style.dart';

class Mode1 extends StatefulWidget {
  final int modeNum;
  const Mode1({Key? key, required this.modeNum}) : super(key: key);
  @override
  State<Mode1> createState() => _Mode1State();
}

class _Mode1State extends State<Mode1> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            height: 250,
            width: double.infinity,
            color: ColorTheme.bgGreenColor),
        Opacity(
          opacity: 0.05,
          child: Container(
            height: 1000,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/img/bgApp1.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Center(
          child: Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              Container(
                padding: const EdgeInsets.all(6.0),
                height: MediaQuery.of(context).size.height * 0.75,
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(
                    color: ColorTheme.whiteBgColor,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: const [
                      BoxShadow(
                        color: ColorTheme.greyOpaColor,
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      )
                    ]),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        const ListItem(
                            title: 'ข้ออธิบายเกี่ยวกับโหมด practice',
                            subtitle:
                                'โหมด practice เป็นโหมดฝึกทักษะการจัดการเป้าหมายอย่างรวดเร็วและความแม่นยำในขณะเคลื่อนที่ของผู้ทดสอบ โดยข้อปฏิบัติของโหมดนี้ประกอบด้วย',
                            bullets: [
                              'การจัดวางและใช้งานอุปกรณ์',
                              'การนับคะแนน'
                            ]),
                        const ListItem(
                            title: 'การจัดวางและใช้งานอุปกรณ์',
                            subtitle:
                                'โดยโหมดนี้จะมีอุปกรณ์หลักๆที่จำเป็นต้องใช้งานคือ เป้ายิง,เลเซอร์ขัดขวาง,อาวุธที่ใช้ทดสอบ และ โทรศัพท์ที่ทำการลงโปรแกรมชุดฝึกนี้ไว้',
                            bullets: []),
                        const ListItem(
                            title: 'หลักการจัดวางและใช้งานอุปกรณ์',
                            subtitle: '',
                            bullets: [
                              'ทำการนำเป้าซ้อมยิงที่มีเซนเซอร์รับสัญญาณไปติดตั้งตามจุดต่างๆตามที่ผู้ทดสอบต้องการโดยมีระยะห่างที่ห่างเพียงพอสำหรับการเคลื่อนที่ยิง',
                              'นำเลเซอร์ขัดขวางไปติดตั้งตามพื้นที่ต่างๆตามให้เหมาะสมกับสภานที่ทดสอบ',
                              'ทำการเชื่อมตัวเซนเซอร์รับสัญญาณกับชุดฝึกให้ชุดฝึกตรวจจับกับเป้าซ้อมยิงและเลเซอร์ขัดขวาง',
                              'เมื่อตัวชุดฝึกเชื่อมกับตัวเซนเซศอร์ทั้งหมดแล้วให้ผู้ใช้งานทำการใช้งานอาวุธตามหลักการใช้และหลักความปลอดภัยอาวุธสากล',
                              'ทำการกดปุ่ม start เมื่อผู้ทดสอบพร้อมในการทดสอบ'
                            ]),
                        const ListItem(
                            title: 'การนับคะแนน',
                            subtitle:
                                'การนับคะแนนในโหมดการทดสอบนี้จะมีส่วนเกี่ยวข้องไปที่การยิงที่เป้าหมายในขณะเลคื่อนที่และหลบอุปสรรคจนครบจำนวนที่กำหนดส่วนของหลักการการยิง',
                            bullets: [
                              'เป้าซ้อมยิงจะแสงสีแดงขึ้นและมีเสียงสัญาณดังแสดงว่าให้ทำการยิง เมื่อยิงโดนสีของไฟสัญญาณจะเปลี่ยนเป็นสีเขียวแสดงว่าทำการยิงถูกเป้าหมาย',
                              'เมื่อผู้ใช้งานยิงถูกเป้าหมายที่หนึ่งแล้วให้การเคลื่อนที่ไปยิงเป้าหมายต่อไปได้เลย',
                              'ในกรณีที่ผู้ใช้งานทำการยิงเป้าหมายไม่ทันภายในเวลา 90 วินาทีสัญญาณจะดังขึ้นที่เป้าหมายนั้น และเมื่อสัญญาณดังอีกครั้งในเวลา 120 วินาทีคะแนนในเป้าหมายนั้นจะถูกตัดออก',
                              'ในกรณีที่ผู้ใช้งานทำการเคลื่อนที่ผ่านตัวเลเซอร์ขัดขวางจะมีสัญญาณดังขึ้นแสดงว่าคะแนนในรอบนั้นจะถูกตัดออก ให้ผู้ใช้งานทำการเคลื่อนที่โดยหลบเลี่ยงตัวเลเซอร์ด้วย',
                              'เมื่อผู้ใช้งานยิงครบทุกเป้าหมายหรือมีโดนหักคะแนนครบทุกเป้าหมายแล้วให้ทำการกดปุ่มหยุดที่ตัวโปรแกรมชุดฝึก'
                            ]),
                        Text(
                          '   เมื่อผู้ใช้งานทำการทดสอบและทำการกดปุ่มหยุดที่ตัวโปรแกรมชุดฝึกเรียบร้อยแล้วโปรแกรมจะแสดงข้อมูลการทดสอบทั้งหมดออกมา',
                          style: FontTheme.miniText,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                TrainingPage(modeNum: widget.modeNum)));
                  },
                  child: Text('Next')),
            ],
          ),
        ),
      ],
    );
  }
}
