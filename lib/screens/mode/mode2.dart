import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:tacticle_app/screens/traningPage.dart';

import '../../models/rule.dart';
import '../../models/style.dart';

class Mode2 extends StatefulWidget {
  final int modeNum;
  const Mode2({Key? key, required this.modeNum}) : super(key: key);

  @override
  State<Mode2> createState() => _Mode2State();
}

class _Mode2State extends State<Mode2> {
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
                            title: 'ข้ออธิบายเกี่ยวกับโหมด fast shot',
                            subtitle:
                                'โหมด fast shot เป็นโหมดที่เกี่ยวข้องกับความแม่นยำในการยิงเป้าหมายของผู้ทดสอบและความรวดเร็วในการยิง โดยข้อปฏิบัตรของโหมดนี้หลักๆจะประกอบด้วย',
                            bullets: [
                              'การจัดวางและใช้งานอุปกรณ์',
                              'การนับคะแนน'
                            ]),
                        const ListItem(
                            title: 'หลักการจัดวางและใช้งานอุปกรณ์',
                            subtitle:
                                'โดยโหมดนี้จะมีอุปกรณ์หลักๆที่จำเป็นต้องใช้งานคือ เป้ายิง,เลเซอร์ขัดขวาง,อาวุธที่ใช้ทดสอบ และ โทรศัพท์ที่ทำการลงโปรแกรมชุดฝึกนี้ไว้',
                            bullets: [
                              'ทำการนำเป้าซ้อมยิงที่มีเซนเซอร์รับสัญญาณไปติดตั้งตามจุดต่างๆตามที่ผู้ทดสอบต้องการโดยมีระยะห่างที่ห่างกันพอสมควร',
                              'ทำการเชื่อมตัวเซนเซอร์รับสัญญาณกับชุดฝึกให้ชุดฝึกตรวจจับกับเป้าซ้อมยิง',
                              'เมื่อตัวชุดฝึกเชื่อมกับตัวเซนเซศอร์ทั้งหมดแล้วให้ผู้ใช้งานทำการใช้งานอาวุธตามหลักการใช้และหลักความปลอดภัยอาวุธสากล',
                              'ทำการกดปุ่ม start เมื่อผู้ทดสอบพร้อมในการทดสอบ'
                            ]),
                        const ListItem(
                            title: '•	การนับคะแนน',
                            subtitle:
                                'การนับคะแนนในโหมดการทดสอบนี้จะมีส่วนเกี่ยวข้องไปที่การยิงต่อเนื่องที่เป้าหมายจนครบจำนวนในเวลาที่กำหนด โดยไม่ต้องเคลื่อนที่',
                            bullets: [
                              'เป้าซ้อมยิงจะแสงสีแดงขึ้นและมีเสียงสัญาณดังแสดงว่าให้ทำการยิง เมื่อยิงโดนสีของไฟสัญญาณจะเปลี่ยนเป็นสีเขียวแสดงว่าทำการยิงถูกเป้าหมาย',
                              'เมื่อผู้ใช้งานยิงถูกเป้าหมายที่หนึ่งแล้วให้ทำการเลื่อนไปยิงเป้าหมายต่อไปได้เลย',
                              'ในกรณีที่ผู้ใช้งานทำการยิงเป้าหมายไม่ทันภายในเวลา 60 วินาทีสัญญาณจะดังขึ้นที่เป้าหมายนั้น และเมื่อสัญญาณดังอีกครั้งในเวลา 120 วินาทีคะแนนในเป้าหหมายนั้นจะถูกตัดออก',
                              'เมื่อผู้ใช้งานยิงครบตามเวลาที่กำหนดแล้วตัวชุดฝึกจะทำการหยุดเองและแสดงคะแนนออกมา',
                              'เวลาที่กำหนดทั้งหมดที่ต้องยิงเป้าหมายให้ครบคือ 3 นาที',
                            ]),
                        Text(
                          '   เมื่อผู้ใช้งานทำการทดสอบและทำการกดปุ่มหยุดที่ตัวโปรแกรมชุดฝึกเรียบร้อยแล้วโปรแกรมจะแสดงสกอร์ที่เป็นสกอร์ที่ทำการยิงได้ในการทดสอบในเวลา 3 นาทีเป็นคะแนนออกมา',
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
