import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:darathong_ui/darathong_ui.dart';

void main() {
  testWidgets('GoldenButton widget test', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: GoldenButton(
            text: 'Test Button',
            onPressed: () {},
          ),
        ),
      ),
    );

    expect(find.text('Test Button'), findsOneWidget);

    await tester.tap(find.text('Test Button'));
    await tester.pump();
    // Add more assertions if necessary
  });

  testWidgets('GoldenCheckbox widget test', (WidgetTester tester) async {
    bool value = false;
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: GoldenCheckbox(
            value: value,
            onChanged: (newValue) {
              value = newValue ?? false;
            },
          ),
        ),
      ),
    );

    expect(find.byType(GestureDetector), findsOneWidget);
    await tester.tap(find.byType(GestureDetector));
    expect(value, true);
    // Add more assertions if necessary
  });

  testWidgets('GoldenCircularProgress widget test',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: GoldenCircularProgress(
            size: 50,
            percentage: 50,
          ),
        ),
      ),
    );

    expect(find.byType(SizedBox), findsOneWidget);
    // Add more assertions if necessary
  });

  testWidgets('GoldenIcon widget test', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: GoldenIcon(Icons.star),
        ),
      ),
    );

    expect(find.byType(ShaderMask), findsOneWidget);
    // Add more assertions if necessary
  });

  testWidgets('GoldenProgressBar widget test', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: GoldenProgressBar(
            width: 200,
            height: 20,
            progress: 0.5,
          ),
        ),
      ),
    );

    expect(find.byType(Container), findsNWidgets(2));
    // Add more assertions if necessary
  });

  testWidgets('GoldenRadio widget test', (WidgetTester tester) async {
    int groupValue = 1;
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: GoldenRadio(
            text: 'Test Radio',
            value: 1,
            groupValue: groupValue,
            onChanged: (newValue) {
              groupValue = newValue ?? 1;
            },
          ),
        ),
      ),
    );

    expect(find.byType(GestureDetector), findsOneWidget);
    await tester.tap(find.byType(GestureDetector));
    expect(groupValue, 1);
    // Add more assertions if necessary
  });

  testWidgets('GoldenStarRating widget test', (WidgetTester tester) async {
    int rating = 0;
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: GoldenStarRating(
            rating: rating,
            onRatingChanged: (newRating) {
              rating = newRating;
            },
          ),
        ),
      ),
    );

    expect(find.byType(Icon), findsNWidgets(5));
    await tester.tap(find.byType(Icon).last);
    expect(rating, 5);
    // Add more assertions if necessary
  });
}
