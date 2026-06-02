import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iconly/iconly.dart';

const _expectedPackage = 'iconly';

void main() {
  group('IconlyLight', () {
    test('constants are IconData from the IconlyLight font in this package', () {
      expect(IconlyLight.activity, isA<IconData>());
      expect(IconlyLight.activity.fontFamily, 'IconlyLight');
      expect(IconlyLight.activity.fontPackage, _expectedPackage);
    });

    test('exposes the expected code points', () {
      expect(IconlyLight.activity.codePoint, 0xe900);
      // The Light font (unlike Bold/Broken) places this glyph at the astral
      // code point 0x1f405 — verified against fonts/IconlyLight.ttf, which has
      // no glyph at 0xe915. Asserted to guard against a "helpful" normalisation
      // that would render a missing-glyph box.
      expect(IconlyLight.arrow_up_square.codePoint, 0x1f405);
      expect(IconlyLight.work.codePoint, 0xe963);
    });
  });

  group('IconlyBold', () {
    test('constants are IconData from the IconlyBold font in this package', () {
      expect(IconlyBold.activity, isA<IconData>());
      expect(IconlyBold.activity.fontFamily, 'IconlyBold');
      expect(IconlyBold.activity.fontPackage, _expectedPackage);
    });

    test('exposes the expected code points', () {
      expect(IconlyBold.activity.codePoint, 0xe900);
      // Bold places arrow_up_square at 0xe915 (not the Light font's 0x1f405).
      expect(IconlyBold.arrow_up_square.codePoint, 0xe915);
    });
  });

  group('IconlyBroken', () {
    test('constants are IconData from the IconlyBroken font in this package', () {
      expect(IconlyBroken.activity, isA<IconData>());
      expect(IconlyBroken.activity.fontFamily, 'IconlyBroken');
      expect(IconlyBroken.activity.fontPackage, _expectedPackage);
    });

    test('exposes the expected code points', () {
      expect(IconlyBroken.activity.codePoint, 0xe900);
      // Broken places arrow_up_square at 0xe915 (not the Light font's 0x1f405).
      expect(IconlyBroken.arrow_up_square.codePoint, 0xe915);
    });
  });

  test('the three sets share code points but differ by font family', () {
    expect(IconlyLight.search.codePoint, IconlyBold.search.codePoint);
    expect(IconlyLight.search.codePoint, IconlyBroken.search.codePoint);
    expect(
      {
        IconlyLight.search.fontFamily,
        IconlyBold.search.fontFamily,
        IconlyBroken.search.fontFamily,
      },
      {'IconlyLight', 'IconlyBold', 'IconlyBroken'},
    );
  });

  testWidgets('constants render in the standard Icon widget', (tester) async {
    await tester.pumpWidget(
      const Directionality(
        textDirection: TextDirection.ltr,
        child: Icon(IconlyLight.search),
      ),
    );

    final icon = tester.widget<Icon>(find.byType(Icon));
    expect(icon.icon, IconlyLight.search);
  });
}
