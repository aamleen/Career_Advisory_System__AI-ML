import pandas as pd
import numpy as np
import csv
from dijkstar import Graph, find_path



df = pd.read_csv('roaddistance.csv')
df.drop(df.columns[[21]], axis=1, inplace=True)

cities_v=df['Distance in Kilometres']
df.set_index('Distance in Kilometres',inplace=True)
print(df)
cities_h=list(df.columns)
#cities_h=cities_h[1:]


#cities=cities_v + list(set(cities_h) - set(cities_v))
bfs_df=[]

city_map=Graph(undirected=True)
cities=list(cities_v)
cities.extend(cities_h)
cities=list(set(cities))

for i in cities:
    city_map.add_node(i.lower())


for i in cities_v:
    row=[]
    for j in cities_h:
        row=[]
        row.append(i.lower())
        row.append(j.lower())
        n=df[j][i]
        num=int(0)
        if(n.isdigit()):
            num=int(n)
        else:
            num=0
        
        row.append(num)
        city_map.add_edge(i.lower(), j.lower(), num)
        bfs_df.append(row)
        row=[]
        row.append(j.lower())
        row.append(i.lower())
        row.append(num)
        bfs_df.append(row)



filename = "distance.csv"

with open(filename, 'w',newline='') as csvfile: 
    csvwriter = csv.writer(csvfile)
    csvwriter.writerows(bfs_df)

heuristics=set()

for i in cities:
    for j in cities:
        try:
            shortest_dist=find_path(city_map, i.lower(), j.lower()).total_cost
        except:
            print("Error in City: ",i,",  ",j) 
        if(shortest_dist>60):
            shortest_dist-=60
        row=tuple([i.lower(),j.lower(),shortest_dist])
        heuristics.add(row)
        row=tuple([j.lower(),i.lower(),shortest_dist])
        heuristics.add(row)

heuristic_=[]
for i in heuristics:
    heuristic_.append(list(i))


heuristic_.sort()
filename = "heuristics.csv"

with open(filename, 'w',newline='') as csvfile: 
    csvwriter = csv.writer(csvfile)
    csvwriter.writerows(heuristic_)