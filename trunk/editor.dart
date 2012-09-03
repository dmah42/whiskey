#import('lib/whisk.dart', prefix: 'whisk');

void main() {
  print('--- JSON begin ---');
  print(whisk.createTestSceneJSON());
  print('--- JSON end   ---');
}
