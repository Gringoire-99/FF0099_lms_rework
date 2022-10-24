package common.utils.validator.group;//package com.example.lms2.utils.validator.group;
//
//import java.util.HashSet;
//import java.util.Set;
//
//public class ListValueConstraintValidator implements ConstraintValidator<ListVal, Integer> {
//    private Set<Integer> set = new HashSet<Integer>();
//
//    /**
//     * 初始化方法
//     * 可以读取注解的属性
//     *
//     * @param constraintAnnotation
//     */
//    @Override
//    public void initialize(ListVal constraintAnnotation) {
//        for (int value : constraintAnnotation.values()) {
//            set.add(value);
//        }
//
//    }
//
//    /**
//     * 校验方法
//     * 对对象的值进行校验
//     *
//     * @param integer
//     * @param constraintValidatorContext
//     * @return
//     */
//    @Override
//    public boolean isValid(Integer integer, ConstraintValidatorContext constraintValidatorContext) {
//        return set.contains(integer);
//    }
//}
