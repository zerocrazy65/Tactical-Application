import 'package:flutter/material.dart';

import '../../models/style.dart';

class InfoContentPage extends StatelessWidget {
  final String? subtitle;
  final num? mode;

  const InfoContentPage({Key? key, required this.subtitle, required this.mode})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(subtitle!),
      ),
      body: Stack(children: [
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
        Padding(
          padding: const EdgeInsets.only(top: kToolbarHeight + 16.0),
          child: ListTile(
            title: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(3),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    )
                  ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (mode == 1)
                    Flexible(
                        child: SingleChildScrollView(
                      child: Column(children: [
                        _buildListItem(
                          context,
                          'การตั้งท่าและความมั่นคง',
                          'ท่ายิงมีความสำคัญต่อการยิงเป็นอย่างยิ่งเพราะการตั้งท่าที่ดีนั้นจะก่อให้เกิดความสมดุลและความมั่นคงของร่างกายและมือ โดยมีวิธีการตั้งท่าเบื้องต้นคือ',
                          [
                            'วางเท้าให้ห่างกันเท่ากับความกว้างของหัวไหล่',
                            'ให้น้ำหนักตัวและปืน ตกลงบนขาทั้งสองข้าง',
                            'แขนที่ใช้ยิงจะต้องเหยียดเต็มที่ พร้อมทั้งข้อมือและข้อศอกจะต้องนิ่งที่สุด',
                          ],
                        ),
                        _buildListItem(
                          context,
                          'การจับปืน ',
                          'การจับปืนที่ถูกต้องเบื้องต้นคือ',
                          [
                            'ให้ทำมือเป็นรูปตัว “V”',
                            'นำด้ามปื นสอดเข้าอุ้งมือ',
                            'ให้แนวของลำกล้องขนานกันเขน และส่วนบนของมือเสมอกับส่วนบนของด้ามปืน',
                            'ใช้นิ้วกลาง นิ้วนาง และนิ้วก้อยกำด้ามปืน',
                            'นิ้วชี้เมื่อยังไม่ใช้ให้วางไว้ข้างปืนเหนือโกร่งไกปืน',
                            'นิ้วหัวแม่มือควรเหยียดตรงและวางแนบข้างปืน',
                            'การแตะไกรปืน ให้ใช้นิ้วชี้ข้อปลายส่วนกลางข้อแตะที่ไกปืน',
                          ],
                        ),
                        _buildListItem(
                          context,
                          'การเล็ง',
                          'การจัดให้ลำกล้องปืนชี้ไปยังเป้ายิง ซึ่งมีสูตรการเล็งอยู่ว่า “หลับตาซ้าย เล็งด้วยตาขวา ให้ยอดศูนย์หน้าอยู่กึ่งกลางช่องบากศูนย์หลังเสมอ วางไว้ส่วนล่างของที่หมาย”',
                          [],
                        ),
                        _buildListItem(
                          context,
                          'การยิง',
                          'ขั้นตอนการยิงปืนพื้นฐานคือ',
                          [
                            'นำมือที่ไม่ใช้ยิงหยิบปืน แล้วนำไปวางในมือที่ใช้ยิง',
                            'ตรวจสอบศูนย์ปืน',
                            'ตรวจสอบศูนย์ปืน',
                            'หายใจลึกๆประมาณ 2 ครั้ง',
                            'หายใจครั้งที่ 3 พร้อมยกปืนขึ้น เมื่อถึงเป้าหมายให้หายใจออก',
                            'ค่อยๆสัมผัสไกปืน',
                            'เล็งไปยังจุดเป้าหมาย',
                            'กดไกปืนอย่างนุ่มนวล',
                            'รักษาสภาพการยิงให้ยังคงนิ่งอยู่',
                            'ค่อยๆลดมือลง จากนั้นจึงทำการวิเคราะห์การยิง',
                          ],
                        ),
                      ]),
                    )),
                  if (mode == 2) Text('2'),
                  if (mode == 3) Text('3'),
                  if (mode == 4) Text('4'),
                  if (mode == 5) Text('5'),
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}

Widget _buildListItem(
  BuildContext context,
  String title,
  String subtitle,
  List<String> bullets,
) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headline6,
        ),
        const SizedBox(height: 8),
        Text(subtitle),
        const SizedBox(height: 8),
        if (bullets.isNotEmpty)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (final bullet in bullets)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          '•',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            bullet,
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ]),
                ),
            ],
          ),
      ],
    ),
  );
}
