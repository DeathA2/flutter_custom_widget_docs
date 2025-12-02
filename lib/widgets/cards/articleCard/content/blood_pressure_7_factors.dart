import 'package:flutter/material.dart';
import 'package:flutter_custom_widget_docs/widgets/cards/articleCard/content/article_content.dart';

class BloodPressure7Factors extends StatelessWidget {
  const BloodPressure7Factors({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        defaultStyleRichText([
          const TextSpan(
            text:
                'Blood pressure-related diseases have many potential health risks. It is worth mentioning that the number of people suffering from the effects of blood pressure-related disease is increasing, and the age of those people is decreasing. Understanding these 7 major factors can help you and your loved ones maintain a healthy body by keeping the blood pressure stable.\n\n',
          ),
          TextSpan(style: mediumArticleStyle(), text: '1/ Family history\n'),
          const TextSpan(
            text:
                'Some people have a genetic predisposition to hypertension. This could be due to a genetic mutation or abnormality passed down from parent to child.\n\n',
          ),
          TextSpan(style: mediumArticleStyle(), text: '2/ Age\n'),
          const TextSpan(
            text:
                'As the age increases, the blood vessel walls age and harden, reducing their elasticity, increasing the pressure in the blood vessels. As a result, the elderly are more likely to experience blood pressure issues than younger people.\nAccordingly, age is an irreversible risk factor for hypertension. However, knowing how to limit other factors that increase blood pressure will help stabilize and sustain a healthy blood pressure over time.\n\n',
          ),
          TextSpan(style: mediumArticleStyle(), text: '3/ Obesity\n'),
          const TextSpan(
            text:
                'As body weight increases, blood pressure can increase. Being overweight can make one more susceptible to high blood pressure, so losing weight is a powerful way to reduce high blood pressure. Even a small amount of weight loss can create have great impacts on the prevention and treatment of high blood pressure.\n\n',
          ),
          TextSpan(style: mediumArticleStyle(), text: '4/ Stress\n'),
          const TextSpan(
            text:
                'Stress in and of itself does not cause long-term high blood pressure. However, because blood pressure can spike during times of stress, persistent anxiety or stress can have long term effects.\nRegular or daily spikes in blood pressure can cause damage to blood vessels, the heart and kidneys, which may in turn lead to chronic high blood pressure. In addition, people feeling chronic anxiety or stress are more likely to engage in unhealthy habits that can raise blood pressure, such as: smoking, drinking alcohol, or overeating.\n\n',
          ),
          TextSpan(style: mediumArticleStyle(), text: '5/ Diet\n'),
          const TextSpan(
            text:
                'Deficiencies in essential nutrients, such as folic acid or iron, can cause red blood cell counts or hemoglobin levels to drop, leading to anemia, and contributing to high blood pressure. Changes in blood sugar, like those caused by diabetes, can be a contributing factor to high blood pressure, as well as an excess of salt or alcohol in the diet.\n\n',
          ),
          TextSpan(style: mediumArticleStyle(), text: '6/ Smoking\n'),
          const TextSpan(
            text:
                'Smoking just before taking a blood pressure reading can lead to inaccurate results. Smoking increases the constriction of the arteries, causing temporary high blood pressure.\n\n',
          ),
          TextSpan(style: mediumArticleStyle(), text: '7/ Exercise\n'),
          const TextSpan(
            text:
                'Lack of physical activity and exercise is another factor which can contribute to high blood pressure. Regular daily physical activity for a period of 30 to 45 minutes will significantly reduce the risk of cardiovascular disease in general, and hypertension in particular.',
          ),
        ]),
      ],
    );
  }
}
