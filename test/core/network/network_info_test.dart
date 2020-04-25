import 'package:covid_impact/core/network/network_info.dart';
import 'package:mockito/mockito.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter_test/flutter_test.dart';

class MockDataConnectionChecker extends Mock implements DataConnectionChecker {}

void main() {
  MockDataConnectionChecker mockDataConnectionChecker;
  NetworkInfoImpl networkInfoImpl;

  setUp(() {
    mockDataConnectionChecker = MockDataConnectionChecker();
    networkInfoImpl = NetworkInfoImpl(mockDataConnectionChecker);
  });

  group('isConnected', () {
    test(
     'should forward to call to DataConnectionChecker.hasConnection',
     () async {
       // arrange
       final tHasConnectionFuture = Future.value(true);

       when(mockDataConnectionChecker.hasConnection)
       .thenAnswer((_) => tHasConnectionFuture);
       // act
       final result = networkInfoImpl.isConnected;
       // assert
       verify(mockDataConnectionChecker.hasConnection);
       expect(result, tHasConnectionFuture);
       
     },
    );


  });
}