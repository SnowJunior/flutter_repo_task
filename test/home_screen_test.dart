import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:github/models/repository.model.dart';
import 'package:github/presentation/screens/home_main_screen.dart';
import 'package:github/presentation/widgets/project_tile_item.dart';
import 'package:github/viewmodels/home_viewmodel.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:stacked/stacked.dart';

import 'home_screen_test.mocks.dart';


@GenerateMocks([HomeViewModel])
void main() {
  late MockHomeViewModel mockViewModel;

  setUp(() {
    mockViewModel = MockHomeViewModel();
  });

  Widget createTestWidget() {
    return MaterialApp(
      home: ViewModelBuilder<HomeViewModel>.reactive(
        viewModelBuilder: () => mockViewModel,
        builder: (context, model, child) => const HomeMainScreen(),
      ),
    );
  }

  testWidgets('renders TextFormField', (WidgetTester tester) async {
    when(mockViewModel.isBusy).thenReturn(false);
    when(mockViewModel.hasError).thenReturn(false);
    when(mockViewModel.repositoryList).thenReturn([]);

    await tester.pumpWidget(createTestWidget());

    expect(find.byType(TextFormField), findsOneWidget);
  });

  testWidgets('Next button is clickable', (WidgetTester tester) async {
    when(mockViewModel.isBusy).thenReturn(false);
    when(mockViewModel.nextPage()).thenReturn(null);

    await tester.pumpWidget(createTestWidget());

    final nextButton = find.widgetWithText(ElevatedButton, 'Next');
    expect(nextButton, findsOneWidget);

    await tester.tap(nextButton);
    await tester.pump();

    verifyNever(mockViewModel.nextPage()).called(0);
  });
}
