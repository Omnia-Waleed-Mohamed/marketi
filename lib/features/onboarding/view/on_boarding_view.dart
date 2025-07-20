import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi/core/constant/color.dart';
import 'package:marketi/core/utils/onboarding_list.dart';
import 'package:marketi/features/onboarding/view_model/cubit/on_boarding_cubit.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OnBoardingCubit, OnBoardingState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = OnBoardingCubit.get(context);
        return Scaffold(
          body: SafeArea(
              child: SizedBox(
            width: double.infinity,
            child: Column(
              children: <Widget>[
                Expanded(
                    flex: 3,
                    child: PageView.builder(
                      controller: cubit.pageController,
                      onPageChanged: (index){
                        cubit.changeCurrentIndex(index);
                      },
                        itemCount: onBoadingList.length,
                        itemBuilder: (context, index) => Column(
                              children: [
                                SizedBox(
                                  height: 50.h,
                                ),
                                Image.asset(onBoadingList[index].image!),
                                SizedBox(
                                  height: 20.h,
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 8),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          ...List.generate(
                                              onBoadingList.length,
                                              (index) => AnimatedContainer(
                                                    duration: Duration(
                                                        microseconds: 150),
                                                    margin: EdgeInsets.only(
                                                        right: 5),
                                                    height:
                                                        cubit.currentIndex ==
                                                                index
                                                            ? 20
                                                            : 18,
                                                    width: cubit.currentIndex ==
                                                            index
                                                        ? 20
                                                        : 18,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          cubit.currentIndex ==
                                                                  index
                                                              ? AppColor
                                                                  .darkBlue
                                                              : AppColor
                                                                  .lightBlue,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                  ))
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                Text(
                                  onBoadingList[index].title!,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      color: AppColor.darkBlue),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: 35, left: 25, right: 25),
                                  child: Container(
                                    width: double.infinity,
                                    alignment: Alignment.center,
                                    child: Text(
                                      onBoadingList[index].describtion!,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: AppColor.darkBlue,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                )
                                ,SizedBox(
                                  height: 16.h,
                                ),
                                Spacer(),
                                Padding(padding: EdgeInsets.only(bottom: 40,left: 14,right: 14),
                                child: Container(
                                  width: 347.w,
                                  height: 48.h,
                                  child: MaterialButton(
                                    color: AppColor.kPrimaryColor, 
                                    textColor: Colors.white,
                                    padding: EdgeInsets.only(left: 50,right: 50),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(14)
                                    ),
                                    onPressed: (){
                                      if(context.read<OnBoardingCubit>().currentIndex <onBoadingList.length -1){
                                        context.read<OnBoardingCubit>().nextPage();
                                      }else{
                                       // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=>LoginView));
                                      }
                                    },
                                    child: cubit.currentIndex < onBoadingList.length-1 ? Text('Next',style: TextStyle(fontSize: 18.sp,),) : Text('Get Start',style: TextStyle(fontSize: 18.sp,)),
                                    ),
                                ),)
                              ],
                            )))
              ],
            ),
          )),
        );
      },
    );
  }
}
