#include <math.h>
#include <stdio.h>

#define PI 3.141592

int main()
{
  float area, radio;

  printf("\nRadio de la circunferencia: \
  ");
  scanf("%f", &radio);

  area = PI * pow(radio, 2);

  printf("\nArea de la \"circunferencia\": %f", area);

  return 0;
}