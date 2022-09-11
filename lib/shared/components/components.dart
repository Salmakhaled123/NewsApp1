import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/modules/webView/webViewScreen.dart';

import '../cubit/cubit.dart';
import '../cubit/states.dart';
Widget buildArticleItem(article,context)=>InkWell(onTap: ()
{
  NavigateTo(context, WebViewScreen(url: article['url'],));
},
  child:   Padding(

    padding: const EdgeInsets.all(20.0),

    child: Row(children:

    [

      ConditionalBuilder(condition:article['urlToImage']!=null,
        fallback:(context)=>Container(width: 120,height: 120,
            child:
              Image.network('https://errorcodespro.com/wp-content/uploads/2017/04/http-63525_640.jpg',fit: BoxFit.cover,
                ),
            ),

        builder:(context)=>Container(

            width: 120,

            height: 120,

            decoration: BoxDecoration(borderRadius: BorderRadius.circular(16.0),

                image: DecorationImage(
                    image:NetworkImage
                      ('${article['urlToImage']}'),



                    fit: BoxFit.cover)

            )),

      ),

      SizedBox(width: 20.0,),

      Expanded(

        child: Container(height: 120,

          child: Column(crossAxisAlignment: CrossAxisAlignment.start,

            mainAxisAlignment: MainAxisAlignment.start,

            children:

            [

              Expanded(

                child: Text('${article['title']}',

                  style: Theme.of(context).textTheme.bodyText1,maxLines: 3,overflow: TextOverflow.ellipsis,),

              ),

              Text('${article['publishedAt']}',style: TextStyle(color: Colors.grey),)



            ],),

        ),

      )



    ],),

  ),
);
Widget BuildDivider()=>Container(height: 1.0,
  width: double.infinity,color: Colors.grey,);
Widget ArticleBuilder(list,context,{isSearch=false})=>BlocConsumer<NewsCubit,NewsStates>(builder:(context,state)
{
  return ConditionalBuilder(
      condition: list.length>0,
      builder: (context)=>ListView.separated(physics: const BouncingScrollPhysics(),
          itemBuilder: (context,index)=>buildArticleItem(list[index],context),
          separatorBuilder: (context,index)=>BuildDivider(),
          itemCount: 10) ,
      fallback:(context)=> isSearch?Container(): Center(child: CircularProgressIndicator(color: Colors.teal,)));
},
    listener: (context,index){});
Widget defaultFormField({
  required TextEditingController controller
  , required TextInputType type,
  Function (String)? onsubmit,
  Function (String) ? onchanged,
  required FormFieldValidator<String>?validate,
  required IconData prefix,
  required String label,
  bool  Ispassword=false,
  IconData ?suffix,
  bool readonly=false,
  GestureTapCallback? ontap,
  final VoidCallback? suffixpressed
})=>TextFormField(readOnly:readonly ,
  onTap:ontap ,
  validator: validate,
  obscureText:Ispassword ,
  controller: controller,
  decoration: InputDecoration(
      labelText: label,
      prefixIcon: Icon(prefix),suffixIcon:suffix !=null ? IconButton(icon: Icon(suffix),
    onPressed: suffixpressed,): null ,
      border:const  OutlineInputBorder()),
  onFieldSubmitted:onsubmit ,
  onChanged: onchanged
  ,);
void NavigateTo(context,Widget)=>Navigator.push(context,MaterialPageRoute(builder:(context)=>Widget));

Widget myDivider()=>Container(
  width: double.infinity,
  height: 1.0,color: Colors.grey[600],);