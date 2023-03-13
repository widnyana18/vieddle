import 'package:flutter/material.dart';

class ModelArtistForm extends StatefulWidget {
  @override
  _ModelArtistFormState createState() => _ModelArtistFormState();
}

class _ModelArtistFormState extends State<ModelArtistForm> {
  @override
  Widget build(BuildContext context) {
    return Stepper(
      steps: List.generate(
        stepList.length,
        (idx) {
          return Step(
            title: Text(
              stepList[idx].title,
              style: TextStyle(
                color: Color(0xFF858585),
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            content: Form(child: stepList[idx].content),
            state: StepState.indexed,
            isActive: false,
          );
        },
      ),
      currentStep: 0,
      onStepCancel: () {},
      onStepContinue: () {},
      onStepTapped: (idx) {},
    );
  }

  List<StepEntity> get stepList => [
        StepEntity(
          title: 'Overview',
          content: overviewForm(),
        ),
        StepEntity(
          title: 'Content',
          content: contentForm(),
        ),
      ];

  Widget overviewForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TextFormField(
          controller: TextEditingController(),
          maxLength: 20,
          decoration: InputDecoration(
            labelText: 'Title',
            border: UnderlineInputBorder(),
          ),
        ),
        SizedBox(height: 15),
        TextFormField(
          controller: TextEditingController(),
          maxLines: 6,
          decoration: InputDecoration(
            labelText: 'Description',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          ),
        ),
        IconButton(
          icon: Icon(Icons.info_outline),
          onPressed: () {},
          color: Color(0xFFF6B16C),
          tooltip:
              'Give Some Caption Comment About Your Company and Tag with "#" Sign for Better Sale Your Products',
        ),
        SwitchListTile(
          contentPadding: EdgeInsets.zero,
          title: Text(
            'Enable Comment',
            style: TextStyle(fontSize: 16),
          ),
          subtitle: Text(
            "If doesn't enabled user can't comment your content",
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
          ),
          value: true,
          onChanged: (val) {},
          activeColor: Color(0xFFF27496),
          inactiveThumbColor: Color(0xFF858585),
        ),
      ],
    );
  }

  Widget contentForm() {
    var size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            RaisedButton(
              child: Text('Select Photo'),
              onPressed: () {},
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
            ),
            IconButton(
              icon: Icon(Icons.info_outline),
              onPressed: () {},
              color: Color(0xFFF6B16C),
              tooltip:
                  'After finished to upload you can pin tag name inside photo',
            ),
          ],
        ),
        SizedBox(height: 15),
        LimitedBox(
          maxHeight: size.height * .45,
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
            ),
            itemBuilder: (ctx, idx) {
              return GestureDetector(
                onTap: () {},
                onLongPress: () {},
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/fox-book.jpg'),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Offstage(
                    offstage: false,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            icon: Icon(Icons.person_pin_circle),
                            color: Color(0xFFDBDBDB),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: Icon(Icons.delete),
                            color: Color(0xFFDBDBDB),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
            itemCount: 4,
          ),
        ),
      ],
    );
  }
}

class StepEntity {
  StepEntity({this.title, this.content});

  final String title;
  final Widget content;
}
