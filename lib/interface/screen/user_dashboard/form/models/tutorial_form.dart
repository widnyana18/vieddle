import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:vieddle/interface/screen/user_dashboard/form/models/model_artist_form.dart';

class TutorialForm extends StatelessWidget {
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
          maxLines: 10,
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
        SwitchListTile(
          contentPadding: EdgeInsets.zero,
          title: Text(
            'License',
            style: TextStyle(fontSize: 16),
          ),
          subtitle: Text(
            "I agree with privacy and policy content",
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
          ),
          value: false,
          onChanged: (val) {},
          activeColor: Color(0xFFF27496),
          inactiveThumbColor: Color(0xFF858585),
        ),
      ],
    );
  }

  Widget contentForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            RaisedButton(
              child: Text('Upload Video'),
              onPressed: () {},
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
            ),
            IconButton(
              icon: Icon(FlutterIcons.thumbnails_fou),
              onPressed: () {},
              color: Color(0xFF858585),
            ),
            SizedBox(width: 10),
            IconButton(
              icon: Icon(Icons.info_outline),
              onPressed: () {},
              color: Color(0xFFF6B16C),
              tooltip:
                  'After finished to upload you can set cover content with sc mode',
            ),
          ],
        ),
        SizedBox(height: 15),
        Offstage(
          offstage: false,
          child: AspectRatio(
            aspectRatio: 1.6,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/perfume9.jpg'),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ),
        SizedBox(height: 15),
        Text(
          'Quality Video',
          style: TextStyle(fontSize: 16),
        ),
        SizedBox(height: 10),
        Slider(
          value: 8,
          onChanged: (newVal) {},
          divisions: 6,
          min: 1,
          max: 12,
          label: '720K',
        ),
        SizedBox(height: 15),
        Row(
          children: <Widget>[
            RaisedButton.icon(
              icon: Icon(Icons.subtitles, color: Color(0xFF858585)),
              label: Text('Get Subtitle'),
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
                  'Choose subtitle and setting in your content. You can choose more than once',
            ),
          ],
        ),
        SizedBox(height: 15),
        Row(
          children: <Widget>[
            RaisedButton.icon(
              icon: Icon(Icons.cast, color: Color(0xFF858585)),
              label: Text('Cast Video'),
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
                  'Choose subtitle and setting in your content. You can choose more than once',
            ),
          ],
        ),
      ],
    );
  }
}
