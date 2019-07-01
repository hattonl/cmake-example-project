#ifndef CALC_H_
#define CALC_H_

#if defined(_WIN32) && defined(calc_EXPORTS)
#  if defined(LIBCALC_INTERNAL)
#    define LIBCALC_API __declspec (dllexport)
#  else
#    define LIBCALC_API __declspec (dllimport)
#  endif
#endif

#if !defined(LIBCALC_API)
#  define LIBCALC_API
#endif

LIBCALC_API int Cube(int x);

LIBCALC_API int Square(int x);

#endif
