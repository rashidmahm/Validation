import 'package:flutter/material.dart';

class Dmc extends StatefulWidget {
  const Dmc({super.key});

  @override
  State<Dmc> createState() => _DmcState();
}

class _DmcState extends State<Dmc> {

  var formKey = GlobalKey<FormState>();
  late int eng,math,phy,sci,geo;
  var obtMarks = '';
  var percentage = '';
  var grade = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: const Text('DMC'),
      ),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key:formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                TextFormField(
                  keyboardType: TextInputType.number,
                  
                  decoration: InputDecoration(
                    hintText: 'English',
                    labelText: 'English Marks',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  validator: (text) {
                    if(text== null || text.isEmpty){
                      return 'Please provide english marks';
                    }else {
                      eng = int.parse(text);
                      return null;
                    }
                  },
                ),


                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Physics',
                    labelText: 'Pysics Marks',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  validator: (text) {
                    if(text == null || text.isEmpty){
                      return 'Please enter physics marks';
                    }
                    else {
                      phy = int.parse(text);
                      return null;
                    }
                  },
                ),


                const SizedBox(
                  height: 16,
                ),


                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Maths',
                    labelText: 'Maths Marks',
                    border:OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      ),

                  ),

                  validator: (text) {
                    if(text == null || text.isEmpty ){
                      return 'Please enter maths marks';
                    }
                    else {
                      math = int.parse(text);
                      return null;
                    }
                  },
                ),
                

                const SizedBox(
                  height: 16,
                ),

                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Science',
                    labelText: 'Science Marks',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  validator: (text) {
                    if(text == null || text.isEmpty ){
                      return 'Please enter Science marks';
                    }
                    else {
                      sci = int.parse(text);
                      return null;
                    }
                  },
                ),
                

                const SizedBox(
                  height: 16,
                ),

                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Geography',
                    labelText: 'Geography Marks',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  validator: (text) {
                    if(text == null || text.isEmpty ){
                      return 'Please enter Geography marks';
                    }
                    else {
                      geo = int.parse(text);
                      return null;
                    }
                  },
                ),
                

                const SizedBox(
                  height: 16,
                ),


                Row(
                  children: [
                    Expanded(
                      child:ElevatedButton(
                        style:ElevatedButton.styleFrom(
                          primary: Colors.red,
                        ),
                        onPressed: (){
                          formKey.currentState!.reset();
                          obtMarks = '';
                          grade  = '';
                          percentage = '';
                          setState(() {
                            
                          });
                        },
                        child: const Text('Clear'),
                      ),
                     ),

                    SizedBox(
                      width:16,
                    ),


                     Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.red,
                        ),
                        onPressed: (){
                          if(formKey.currentState!.validate()){
                            int obt = eng + phy + math + sci + geo;
                            double per = obt * 100 / 500;

                            if (per >= 80) {
                                  grade = 'A+';
                                } else if (per >= 70) {
                                  grade = 'A';
                                } else if (per >= 60) {
                                  grade = 'B';
                                } else if (per >= 40) {
                                  grade = 'C';
                                } else {
                                  grade = 'Fail';
                                } 
                                setState(() {
                                  obtMarks = obt.toString();
                                  percentage = per.toString();
                                  formKey.currentState!.reset();
                                });
                          }
                        },
                        child: Text('Calculate'),
                      ),
                      ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),

                Text('Obatined Marks : $obtMarks'),

                const SizedBox(
                  height: 16,
                ),

                Text('Percentage : $percentage'),

                const SizedBox(
                  height: 16,
                ),

                Text('Grade : $grade'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}