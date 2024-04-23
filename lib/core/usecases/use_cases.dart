abstract class UseCase<Type, Parameter> {
  Type call([Parameter parameter]);
}

class NoParameter {}

abstract class UseCaseTwo<Type, ParameterOne, ParameterTwo> {
  Type call([ParameterOne parameterOne, ParameterTwo parameterTwo]);
}