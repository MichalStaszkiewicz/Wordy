// Mocks generated by Mockito 5.4.2 from annotations
// in wordy/test/user_service.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:dio/dio.dart' as _i5;
import 'package:mockito/mockito.dart' as _i1;
import 'package:wordy/data/network/request/login_user_request.dart' as _i19;
import 'package:wordy/data/network/request/models/login_user_request_model.dart'
    as _i22;
import 'package:wordy/data/network/request/register_user_request.dart' as _i20;
import 'package:wordy/data/network/response/login_user_response.dart' as _i18;
import 'package:wordy/data/network/response/update_user_interface_language_response.dart'
    as _i11;
import 'package:wordy/domain/logic/user_service.dart' as _i21;
import 'package:wordy/domain/models/active_course.dart' as _i8;
import 'package:wordy/domain/models/course.dart' as _i9;
import 'package:wordy/domain/models/flash_card_data.dart' as _i15;
import 'package:wordy/domain/models/interface_language.dart' as _i17;
import 'package:wordy/domain/models/profile_data.dart' as _i7;
import 'package:wordy/domain/models/registeration_status.dart' as _i12;
import 'package:wordy/domain/models/topic.dart' as _i6;
import 'package:wordy/domain/models/user_active_courses_progress.dart' as _i10;
import 'package:wordy/domain/models/user_course.dart' as _i16;
import 'package:wordy/domain/models/user_settings.dart' as _i13;
import 'package:wordy/domain/models/word.dart' as _i14;
import 'package:wordy/domain/repositiories/repository.dart' as _i3;
import 'package:wordy/utility/either.dart' as _i2;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeEither_0<Exception, R> extends _i1.SmartFake
    implements _i2.Either<Exception, R> {
  _FakeEither_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [RepositoryMock].
///
/// See the documentation for Mockito's code generation for more information.
class MockRepositoryMock extends _i1.Mock implements _i3.RepositoryMock {
  MockRepositoryMock() {
    _i1.throwOnMissingStub(this);
  }

  @override
  void cleanUpLocalStorate() => super.noSuchMethod(
        Invocation.method(
          #cleanUpLocalStorate,
          [],
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i4.Future<_i2.Either<_i5.DioException, List<_i6.Topic>>> getTopics() =>
      (super.noSuchMethod(
        Invocation.method(
          #getTopics,
          [],
        ),
        returnValue:
            _i4.Future<_i2.Either<_i5.DioException, List<_i6.Topic>>>.value(
                _FakeEither_0<_i5.DioException, List<_i6.Topic>>(
          this,
          Invocation.method(
            #getTopics,
            [],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.DioException, List<_i6.Topic>>>);
  @override
  _i4.Future<_i2.Either<_i5.DioException, String>> recoverAccount(
          String? email) =>
      (super.noSuchMethod(
        Invocation.method(
          #recoverAccount,
          [email],
        ),
        returnValue: _i4.Future<_i2.Either<_i5.DioException, String>>.value(
            _FakeEither_0<_i5.DioException, String>(
          this,
          Invocation.method(
            #recoverAccount,
            [email],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.DioException, String>>);
  @override
  _i4.Future<_i2.Either<_i5.DioException, _i7.ProfileData>> getProfileData(
          String? token) =>
      (super.noSuchMethod(
        Invocation.method(
          #getProfileData,
          [token],
        ),
        returnValue:
            _i4.Future<_i2.Either<_i5.DioException, _i7.ProfileData>>.value(
                _FakeEither_0<_i5.DioException, _i7.ProfileData>(
          this,
          Invocation.method(
            #getProfileData,
            [token],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.DioException, _i7.ProfileData>>);
  @override
  _i4.Future<_i2.Either<Exception, String>> validateResetPasswordToken(
    String? email,
    String? token,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #validateResetPasswordToken,
          [
            email,
            token,
          ],
        ),
        returnValue: _i4.Future<_i2.Either<Exception, String>>.value(
            _FakeEither_0<Exception, String>(
          this,
          Invocation.method(
            #validateResetPasswordToken,
            [
              email,
              token,
            ],
          ),
        )),
      ) as _i4.Future<_i2.Either<Exception, String>>);
  @override
  _i4.Future<_i2.Either<Exception, String>> updatePassword(
    String? email,
    String? password,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #updatePassword,
          [
            email,
            password,
          ],
        ),
        returnValue: _i4.Future<_i2.Either<Exception, String>>.value(
            _FakeEither_0<Exception, String>(
          this,
          Invocation.method(
            #updatePassword,
            [
              email,
              password,
            ],
          ),
        )),
      ) as _i4.Future<_i2.Either<Exception, String>>);
  @override
  _i4.Future<_i2.Either<_i5.DioException, _i8.ActiveCourse>>
      getUserCurrentCourseProgress(String? userId) => (super.noSuchMethod(
            Invocation.method(
              #getUserCurrentCourseProgress,
              [userId],
            ),
            returnValue: _i4.Future<
                    _i2.Either<_i5.DioException, _i8.ActiveCourse>>.value(
                _FakeEither_0<_i5.DioException, _i8.ActiveCourse>(
              this,
              Invocation.method(
                #getUserCurrentCourseProgress,
                [userId],
              ),
            )),
          ) as _i4.Future<_i2.Either<_i5.DioException, _i8.ActiveCourse>>);
  @override
  _i4.Future<
      _i2.Either<_i5.DioException, List<_i9.Course>>> getAvailableCourses(
          String? userId) =>
      (super.noSuchMethod(
        Invocation.method(
          #getAvailableCourses,
          [userId],
        ),
        returnValue:
            _i4.Future<_i2.Either<_i5.DioException, List<_i9.Course>>>.value(
                _FakeEither_0<_i5.DioException, List<_i9.Course>>(
          this,
          Invocation.method(
            #getAvailableCourses,
            [userId],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.DioException, List<_i9.Course>>>);
  @override
  _i4.Future<_i2.Either<_i5.DioException, _i10.UserActiveCoursesProgress>>
      getUserActiveCoursesProgress(String? userId) => (super.noSuchMethod(
            Invocation.method(
              #getUserActiveCoursesProgress,
              [userId],
            ),
            returnValue: _i4.Future<
                    _i2.Either<_i5.DioException,
                        _i10.UserActiveCoursesProgress>>.value(
                _FakeEither_0<_i5.DioException, _i10.UserActiveCoursesProgress>(
              this,
              Invocation.method(
                #getUserActiveCoursesProgress,
                [userId],
              ),
            )),
          ) as _i4.Future<
              _i2.Either<_i5.DioException, _i10.UserActiveCoursesProgress>>);
  @override
  _i4.Future<
      _i2.Either<_i5.DioException,
          _i11.UpdateUserInterfaceLanguageResponse>> switchInterfaceLangauge(
    String? token,
    String? languageName,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #switchInterfaceLangauge,
          [
            token,
            languageName,
          ],
        ),
        returnValue: _i4.Future<
            _i2.Either<_i5.DioException,
                _i11.UpdateUserInterfaceLanguageResponse>>.value(_FakeEither_0<
            _i5.DioException, _i11.UpdateUserInterfaceLanguageResponse>(
          this,
          Invocation.method(
            #switchInterfaceLangauge,
            [
              token,
              languageName,
            ],
          ),
        )),
      ) as _i4.Future<
          _i2.Either<_i5.DioException,
              _i11.UpdateUserInterfaceLanguageResponse>>);
  @override
  _i4.Future<_i2.Either<_i5.DioException, _i12.RegisterationStatus>>
      getRegisterationStatus(String? token) => (super.noSuchMethod(
            Invocation.method(
              #getRegisterationStatus,
              [token],
            ),
            returnValue: _i4.Future<
                    _i2.Either<_i5.DioException,
                        _i12.RegisterationStatus>>.value(
                _FakeEither_0<_i5.DioException, _i12.RegisterationStatus>(
              this,
              Invocation.method(
                #getRegisterationStatus,
                [token],
              ),
            )),
          ) as _i4
              .Future<_i2.Either<_i5.DioException, _i12.RegisterationStatus>>);
  @override
  _i4.Future<_i2.Either<_i5.DioException, _i13.UserSettings>> getUserSettings(
          String? token) =>
      (super.noSuchMethod(
        Invocation.method(
          #getUserSettings,
          [token],
        ),
        returnValue:
            _i4.Future<_i2.Either<_i5.DioException, _i13.UserSettings>>.value(
                _FakeEither_0<_i5.DioException, _i13.UserSettings>(
          this,
          Invocation.method(
            #getUserSettings,
            [token],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.DioException, _i13.UserSettings>>);
  @override
  _i4.Future<_i2.Either<_i5.DioException, String>> insertLearnedWordList(
    List<int>? wordIdList,
    String? token,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #insertLearnedWordList,
          [
            wordIdList,
            token,
          ],
        ),
        returnValue: _i4.Future<_i2.Either<_i5.DioException, String>>.value(
            _FakeEither_0<_i5.DioException, String>(
          this,
          Invocation.method(
            #insertLearnedWordList,
            [
              wordIdList,
              token,
            ],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.DioException, String>>);
  @override
  _i4.Future<_i2.Either<_i5.DioException, List<_i14.Word>>> getLearnedWordList(
          String? token) =>
      (super.noSuchMethod(
        Invocation.method(
          #getLearnedWordList,
          [token],
        ),
        returnValue:
            _i4.Future<_i2.Either<_i5.DioException, List<_i14.Word>>>.value(
                _FakeEither_0<_i5.DioException, List<_i14.Word>>(
          this,
          Invocation.method(
            #getLearnedWordList,
            [token],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.DioException, List<_i14.Word>>>);
  @override
  _i4.Future<_i2.Either<_i5.DioException, List<_i14.Word>>>
      getBeginnerQuizWordList(
    String? topic,
    String? token,
  ) =>
          (super.noSuchMethod(
            Invocation.method(
              #getBeginnerQuizWordList,
              [
                topic,
                token,
              ],
            ),
            returnValue:
                _i4.Future<_i2.Either<_i5.DioException, List<_i14.Word>>>.value(
                    _FakeEither_0<_i5.DioException, List<_i14.Word>>(
              this,
              Invocation.method(
                #getBeginnerQuizWordList,
                [
                  topic,
                  token,
                ],
              ),
            )),
          ) as _i4.Future<_i2.Either<_i5.DioException, List<_i14.Word>>>);
  @override
  _i4.Future<_i2.Either<_i5.DioException, List<_i15.FlashCardData>>>
      createFlashCardList(
    String? topic,
    String? token,
  ) =>
          (super.noSuchMethod(
            Invocation.method(
              #createFlashCardList,
              [
                topic,
                token,
              ],
            ),
            returnValue: _i4.Future<
                    _i2.Either<_i5.DioException,
                        List<_i15.FlashCardData>>>.value(
                _FakeEither_0<_i5.DioException, List<_i15.FlashCardData>>(
              this,
              Invocation.method(
                #createFlashCardList,
                [
                  topic,
                  token,
                ],
              ),
            )),
          ) as _i4
              .Future<_i2.Either<_i5.DioException, List<_i15.FlashCardData>>>);
  @override
  _i4.Future<_i2.Either<_i5.DioException, _i16.UserCourse>>
      updateUserCurrentCourse(
    String? courseName,
    String? token,
  ) =>
          (super.noSuchMethod(
            Invocation.method(
              #updateUserCurrentCourse,
              [
                courseName,
                token,
              ],
            ),
            returnValue:
                _i4.Future<_i2.Either<_i5.DioException, _i16.UserCourse>>.value(
                    _FakeEither_0<_i5.DioException, _i16.UserCourse>(
              this,
              Invocation.method(
                #updateUserCurrentCourse,
                [
                  courseName,
                  token,
                ],
              ),
            )),
          ) as _i4.Future<_i2.Either<_i5.DioException, _i16.UserCourse>>);
  @override
  _i4.Future<_i2.Either<_i5.DioException, _i16.UserCourse>>
      getUserCurrentCourse(String? token) => (super.noSuchMethod(
            Invocation.method(
              #getUserCurrentCourse,
              [token],
            ),
            returnValue:
                _i4.Future<_i2.Either<_i5.DioException, _i16.UserCourse>>.value(
                    _FakeEither_0<_i5.DioException, _i16.UserCourse>(
              this,
              Invocation.method(
                #getUserCurrentCourse,
                [token],
              ),
            )),
          ) as _i4.Future<_i2.Either<_i5.DioException, _i16.UserCourse>>);
  @override
  _i4.Future<_i2.Either<_i5.DioException, String>> updateUserRegisterStatus(
          String? token) =>
      (super.noSuchMethod(
        Invocation.method(
          #updateUserRegisterStatus,
          [token],
        ),
        returnValue: _i4.Future<_i2.Either<_i5.DioException, String>>.value(
            _FakeEither_0<_i5.DioException, String>(
          this,
          Invocation.method(
            #updateUserRegisterStatus,
            [token],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.DioException, String>>);
  @override
  _i4.Future<_i2.Either<_i5.DioException, List<_i17.InterfaceLanguage>>>
      getAvailableLanguages() => (super.noSuchMethod(
            Invocation.method(
              #getAvailableLanguages,
              [],
            ),
            returnValue: _i4.Future<
                    _i2.Either<_i5.DioException,
                        List<_i17.InterfaceLanguage>>>.value(
                _FakeEither_0<_i5.DioException, List<_i17.InterfaceLanguage>>(
              this,
              Invocation.method(
                #getAvailableLanguages,
                [],
              ),
            )),
          ) as _i4.Future<
              _i2.Either<_i5.DioException, List<_i17.InterfaceLanguage>>>);
  @override
  _i4.Future<_i2.Either<_i5.DioException, _i18.LoginUserResponse>>? loginUser(
          _i19.LoginUserRequest? request) =>
      (super.noSuchMethod(Invocation.method(
        #loginUser,
        [request],
      )) as _i4.Future<_i2.Either<_i5.DioException, _i18.LoginUserResponse>>?);
  @override
  _i4.Future<_i2.Either<_i5.DioException, String>> registerUser(
          _i20.RegisterUserRequest? request) =>
      (super.noSuchMethod(
        Invocation.method(
          #registerUser,
          [request],
        ),
        returnValue: _i4.Future<_i2.Either<_i5.DioException, String>>.value(
            _FakeEither_0<_i5.DioException, String>(
          this,
          Invocation.method(
            #registerUser,
            [request],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.DioException, String>>);
  @override
  _i4.Future<_i2.Either<_i5.DioException, List<_i14.Word>>>
      getLearnedWordsByTopic(
    String? topic,
    String? token,
  ) =>
          (super.noSuchMethod(
            Invocation.method(
              #getLearnedWordsByTopic,
              [
                topic,
                token,
              ],
            ),
            returnValue:
                _i4.Future<_i2.Either<_i5.DioException, List<_i14.Word>>>.value(
                    _FakeEither_0<_i5.DioException, List<_i14.Word>>(
              this,
              Invocation.method(
                #getLearnedWordsByTopic,
                [
                  topic,
                  token,
                ],
              ),
            )),
          ) as _i4.Future<_i2.Either<_i5.DioException, List<_i14.Word>>>);
  @override
  _i4.Future<_i2.Either<_i5.DioException, List<_i14.Word>>> getWordsByTopic(
          String? topic) =>
      (super.noSuchMethod(
        Invocation.method(
          #getWordsByTopic,
          [topic],
        ),
        returnValue:
            _i4.Future<_i2.Either<_i5.DioException, List<_i14.Word>>>.value(
                _FakeEither_0<_i5.DioException, List<_i14.Word>>(
          this,
          Invocation.method(
            #getWordsByTopic,
            [topic],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.DioException, List<_i14.Word>>>);
  @override
  void saveTokenAccess(String? token) => super.noSuchMethod(
        Invocation.method(
          #saveTokenAccess,
          [token],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void saveTokenRefresh(String? token) => super.noSuchMethod(
        Invocation.method(
          #saveTokenRefresh,
          [token],
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i4.Future<_i2.Either<_i5.DioException, bool>> cancelRequest() =>
      (super.noSuchMethod(
        Invocation.method(
          #cancelRequest,
          [],
        ),
        returnValue: _i4.Future<_i2.Either<_i5.DioException, bool>>.value(
            _FakeEither_0<_i5.DioException, bool>(
          this,
          Invocation.method(
            #cancelRequest,
            [],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.DioException, bool>>);
}

/// A class which mocks [MockUserService].
///
/// See the documentation for Mockito's code generation for more information.
class MockMockUserService extends _i1.Mock implements _i21.MockUserService {
  MockMockUserService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  void cleanUpLocalStorage() => super.noSuchMethod(
        Invocation.method(
          #cleanUpLocalStorage,
          [],
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i4.Future<_i2.Either<Exception, _i7.ProfileData>> getProfileData() =>
      (super.noSuchMethod(
        Invocation.method(
          #getProfileData,
          [],
        ),
        returnValue: _i4.Future<_i2.Either<Exception, _i7.ProfileData>>.value(
            _FakeEither_0<Exception, _i7.ProfileData>(
          this,
          Invocation.method(
            #getProfileData,
            [],
          ),
        )),
      ) as _i4.Future<_i2.Either<Exception, _i7.ProfileData>>);
  @override
  _i4.Future<_i2.Either<Exception, String>> getTokenAccess() =>
      (super.noSuchMethod(
        Invocation.method(
          #getTokenAccess,
          [],
        ),
        returnValue: _i4.Future<_i2.Either<Exception, String>>.value(
            _FakeEither_0<Exception, String>(
          this,
          Invocation.method(
            #getTokenAccess,
            [],
          ),
        )),
      ) as _i4.Future<_i2.Either<Exception, String>>);
  @override
  _i4.Future<_i2.Either<Exception, String>> validateResetPasswordToken(
    String? email,
    String? token,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #validateResetPasswordToken,
          [
            email,
            token,
          ],
        ),
        returnValue: _i4.Future<_i2.Either<Exception, String>>.value(
            _FakeEither_0<Exception, String>(
          this,
          Invocation.method(
            #validateResetPasswordToken,
            [
              email,
              token,
            ],
          ),
        )),
      ) as _i4.Future<_i2.Either<Exception, String>>);
  @override
  _i4.Future<_i2.Either<Exception, String>> updateUserPassword(
    String? email,
    String? password,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #updateUserPassword,
          [
            email,
            password,
          ],
        ),
        returnValue: _i4.Future<_i2.Either<Exception, String>>.value(
            _FakeEither_0<Exception, String>(
          this,
          Invocation.method(
            #updateUserPassword,
            [
              email,
              password,
            ],
          ),
        )),
      ) as _i4.Future<_i2.Either<Exception, String>>);
  @override
  _i4.Future<_i2.Either<Exception, String>> getTokenRefresh() =>
      (super.noSuchMethod(
        Invocation.method(
          #getTokenRefresh,
          [],
        ),
        returnValue: _i4.Future<_i2.Either<Exception, String>>.value(
            _FakeEither_0<Exception, String>(
          this,
          Invocation.method(
            #getTokenRefresh,
            [],
          ),
        )),
      ) as _i4.Future<_i2.Either<Exception, String>>);
  @override
  _i4.Future<_i2.Either<Exception, _i11.UpdateUserInterfaceLanguageResponse>>
      switchInterfaceLangauge(String? languageName) => (super.noSuchMethod(
            Invocation.method(
              #switchInterfaceLangauge,
              [languageName],
            ),
            returnValue: _i4.Future<
                    _i2.Either<Exception,
                        _i11.UpdateUserInterfaceLanguageResponse>>.value(
                _FakeEither_0<Exception,
                    _i11.UpdateUserInterfaceLanguageResponse>(
              this,
              Invocation.method(
                #switchInterfaceLangauge,
                [languageName],
              ),
            )),
          ) as _i4.Future<
              _i2.Either<Exception, _i11.UpdateUserInterfaceLanguageResponse>>);
  @override
  _i4.Future<_i2.Either<Exception, _i8.ActiveCourse>>
      getUserCurrentCourseProgress() => (super.noSuchMethod(
            Invocation.method(
              #getUserCurrentCourseProgress,
              [],
            ),
            returnValue:
                _i4.Future<_i2.Either<Exception, _i8.ActiveCourse>>.value(
                    _FakeEither_0<Exception, _i8.ActiveCourse>(
              this,
              Invocation.method(
                #getUserCurrentCourseProgress,
                [],
              ),
            )),
          ) as _i4.Future<_i2.Either<Exception, _i8.ActiveCourse>>);
  @override
  _i4.Future<_i2.Either<Exception, List<_i9.Course>>> getAvailableCourses() =>
      (super.noSuchMethod(
        Invocation.method(
          #getAvailableCourses,
          [],
        ),
        returnValue: _i4.Future<_i2.Either<Exception, List<_i9.Course>>>.value(
            _FakeEither_0<Exception, List<_i9.Course>>(
          this,
          Invocation.method(
            #getAvailableCourses,
            [],
          ),
        )),
      ) as _i4.Future<_i2.Either<Exception, List<_i9.Course>>>);
  @override
  _i4.Future<_i2.Either<Exception, _i10.UserActiveCoursesProgress>>
      getUserActiveCoursesProgress() => (super.noSuchMethod(
            Invocation.method(
              #getUserActiveCoursesProgress,
              [],
            ),
            returnValue: _i4.Future<
                    _i2.Either<Exception,
                        _i10.UserActiveCoursesProgress>>.value(
                _FakeEither_0<Exception, _i10.UserActiveCoursesProgress>(
              this,
              Invocation.method(
                #getUserActiveCoursesProgress,
                [],
              ),
            )),
          ) as _i4
              .Future<_i2.Either<Exception, _i10.UserActiveCoursesProgress>>);
  @override
  _i4.Future<void> updateRegisterationStatus(String? token) =>
      (super.noSuchMethod(
        Invocation.method(
          #updateRegisterationStatus,
          [token],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
  @override
  _i4.Future<_i2.Either<Exception, _i16.UserCourse>> updateUserCurrentCourse(
          String? courseName) =>
      (super.noSuchMethod(
        Invocation.method(
          #updateUserCurrentCourse,
          [courseName],
        ),
        returnValue: _i4.Future<_i2.Either<Exception, _i16.UserCourse>>.value(
            _FakeEither_0<Exception, _i16.UserCourse>(
          this,
          Invocation.method(
            #updateUserCurrentCourse,
            [courseName],
          ),
        )),
      ) as _i4.Future<_i2.Either<Exception, _i16.UserCourse>>);
  @override
  _i4.Future<_i2.Either<Exception, _i16.UserCourse>> getUserCurrentCourse() =>
      (super.noSuchMethod(
        Invocation.method(
          #getUserCurrentCourse,
          [],
        ),
        returnValue: _i4.Future<_i2.Either<Exception, _i16.UserCourse>>.value(
            _FakeEither_0<Exception, _i16.UserCourse>(
          this,
          Invocation.method(
            #getUserCurrentCourse,
            [],
          ),
        )),
      ) as _i4.Future<_i2.Either<Exception, _i16.UserCourse>>);
  @override
  _i4.Future<_i2.Either<Exception, String>> loginUser(
          _i22.LoginUserModel? requestModel) =>
      (super.noSuchMethod(
        Invocation.method(
          #loginUser,
          [requestModel],
        ),
        returnValue: _i4.Future<_i2.Either<Exception, String>>.value(
            _FakeEither_0<Exception, String>(
          this,
          Invocation.method(
            #loginUser,
            [requestModel],
          ),
        )),
      ) as _i4.Future<_i2.Either<Exception, String>>);
  @override
  _i4.Future<void> logOut() => (super.noSuchMethod(
        Invocation.method(
          #logOut,
          [],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
  @override
  _i4.Future<_i2.Either<Exception, String>> recoverAccount(String? email) =>
      (super.noSuchMethod(
        Invocation.method(
          #recoverAccount,
          [email],
        ),
        returnValue: _i4.Future<_i2.Either<Exception, String>>.value(
            _FakeEither_0<Exception, String>(
          this,
          Invocation.method(
            #recoverAccount,
            [email],
          ),
        )),
      ) as _i4.Future<_i2.Either<Exception, String>>);
  @override
  _i4.Future<_i2.Either<Exception, String>> registerUser(
          Map<String, dynamic>? userAuthData) =>
      (super.noSuchMethod(
        Invocation.method(
          #registerUser,
          [userAuthData],
        ),
        returnValue: _i4.Future<_i2.Either<Exception, String>>.value(
            _FakeEither_0<Exception, String>(
          this,
          Invocation.method(
            #registerUser,
            [userAuthData],
          ),
        )),
      ) as _i4.Future<_i2.Either<Exception, String>>);
}