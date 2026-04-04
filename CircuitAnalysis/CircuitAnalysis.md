# Circuit Analysis

## Effect of different circuts on Constructors based on laptime a erage

The analytical question proposed here is: 
 How well does each constructor perform on average at specific circuits: Do specific constructors perform better or worse at certain circuits? We can determine this by comparing the average lap times between constructors. (Q2 on the project proposal )

## 1. General analysis: Average lap time fo each circuit and constructor

<table>
  <tr>
    <td><img src="Images/1-1.png" width="100%"></td>
    <td><img src="Images/1-2.png" width="100%"></td>
  </tr>
</table>

As we can see from the two scatter plots avobe, there are circuit dependence and constructor denpendence on the average lap time.

## 2.Average lap time on each circuit for a specific constructor

<table>
  <tr>
    <td><img src="Images/2-1.png" width="100%"></td>
    <td><img src="Images/2-2.png" width="100%"></td>
  </tr>
</table>

Since there are 212 different constructors, 2 of them were chosen for example. From the distribution in the avobe plots, it is clear that the circuit dependency exist per constructor as well.

## 3. Circuits that have the best performace and the circuits that have the worst performance over all the constructors

<table>
  <tr>
    <td><img src="Images/3-1.png" width="100%"></td>
    <td><img src="Images/3-2.png" width="100%"></td>
  </tr>
</table>

Red Bull Ring has the shortest lap time average for most of the constructors which mean it tends to prforme the best with various constructors.
On the other hand, Circuit de Spa-Francorchamps and Autodromo internazionale del Mugello seems to hold the longest lap time average for many constructors.

## 4. Difference between the best peformance circuit and the worst peformance circuit

<table>
  <tr>
    <td><img src="Images/4-1.png" width="100%"></td>
    <td><img src="Images/4-2.png" width="100%"></td>
  </tr>
  <tr>
    <td><img src="Images/4-3.png" width="100%"></td>
    <td><img src="Images/4-3.5.png" width="100%"></td>
  </tr>
  <tr>
    <td><img src="Images/4-4.png" width="100%"></td>
    <td><img src="Images/4-5.png" width="100%"></td>
  </tr>
  <tr>
    <td><img src="Images/4-6.png" width="100%"></td>
    <td><img src="Images/4-7.png" width="100%"></td>
  </tr>
</table>

The first table list out the top5 large difference in performance dpending on the circuit used.
The second plot visualizes the above table with its difference in average lap time (max-min) on the y axis.
The plots with two boxes describe which circuit hold the maximum and minimum average lap time for the constructors listed in top5 from above.
So even though in general the Red Bull Ring holds the shortest average latime for many constructors, for some constructors like Lotus performs the best on a different circuit and has a large difference from its worst peformance circuit. 
It is also true that not all the constructors have experienced all the circuits listed, so as we can see from the plot titled "Average Lap Times by Circuit for ConstructorId = 12", Lotus has not had a race with Red Bull Ring while it still shows the best peformace with others.

## Conclusion

Q2: Do specific constructors perform better or worse at certain circuits?
A: Yes, the circuits affect the performance of each constructor. We found that the Red Bull Ring tends to perform better with many constructors. However, other constructors that have not performed at that specific circuit still show that performance depends on the circuit, and they may perform better or worse at certain ones.

Overall, specific constructors do perform better or worse at certain circuits. To check each constructor’s information on this, the same analysis with a specified constructor ID can be done in the Google Colab notebook. The plot titled "Average Lap Times by Circuit for ConstructorId = ..." will be useful to identify each constructor’s best and worst performing circuits.


