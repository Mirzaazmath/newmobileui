import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class AttendanceList extends StatefulWidget {
  const AttendanceList({Key? key}) : super(key: key);

  @override
  State<AttendanceList> createState() => _AttendanceListState();
}

class _AttendanceListState extends State<AttendanceList> {
  bool selectall=false;
  bool leave=false;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const  Text("Student(10)"),
                CupertinoSwitch(value: selectall, onChanged: (value){
                  setState(() {
                    selectall=!selectall;
                  });


                }),


              ],
            ),
            const  SizedBox(height: 20,),
            Row(

              children: const [
                Expanded(
                    flex: 3,
                    child: Text("Name",style: TextStyle(fontSize: 13),)),
                Expanded(
                    flex:2,
                    child: Center(child: Text("Leave",style: TextStyle(fontSize: 13),))),
                Expanded(
                    flex: 2,
                    child: Text("Absent/Present",style: TextStyle(fontSize: 13),)),

              ],
            ),
            const  SizedBox(height: 20,),
            ListView.builder(
                physics:const  NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 10,
                itemBuilder: (context,index){
                  return attendanceitem();
                })

          ],
        ),
      ),
    );
  }
  Widget attendanceitem(){
    return   Row(

      children:  [
        Expanded(
            flex: 3,
            child:ListTile(
              contentPadding: EdgeInsets.zero,
              leading: CircleAvatar(
                radius: 22,
              ),
              title: Text("Syed Ahmed",style: TextStyle(fontSize: 13)),

            )
        ),
        Expanded(
            flex:2,
            child: Checkbox(value:leave , onChanged: (value){
              setState(() {
                leave=!leave;
              });

            })),
        Expanded(
          flex: 2,
          child: CupertinoSwitch(value: selectall, onChanged: (value){
            setState(() {
              selectall=!selectall;
            });


          }),
        ),

      ],
    );
  }
}
