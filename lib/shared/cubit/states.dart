abstract class NewsStates{}
class NewsInitialState extends NewsStates{}
class NewsBottomNavbarState extends NewsStates{}
class NewsGetBuissnessDataSuccessState extends NewsStates{}
class NewsGetDataErrorState extends NewsStates
{
  final String error;
  NewsGetDataErrorState(this.error);
}
class NewsBuisnessLoadingState extends NewsStates{}

class NewsGetSportsDataSuccessState extends NewsStates{}
class NewsGetDataSportsErrorState extends NewsStates
{
  final String error;
  NewsGetDataSportsErrorState(this.error);
}
class NewsSportsLoadingState extends NewsStates{}
class NewsGetScienceDataSuccessState extends NewsStates{}
class NewsGetDataScienceErrorState extends NewsStates
{
  final String error;
  NewsGetDataScienceErrorState(this.error);
}
class NewsScienceLoadingState extends NewsStates{}
class NewsAppChangeMode extends NewsStates{}
class NewsGetSearchDataSuccessState extends NewsStates{}
class NewsGetDataSearchErrorState extends NewsStates
{
  final String error;
  NewsGetDataSearchErrorState(this.error);
}
class NewsSearchLoadingState extends NewsStates{}