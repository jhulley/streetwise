Tasks:

```
rake graph_seed:create_graph_nodes                #6700 seconds
rake graph_seed:create_neighbor_relationships     #13300 seconds
rake graph_seed:create_node_labels                #2100 seconds
rake graph_seed:create_intersects_relationships   #6400 seconds
rake graph_seed:delete_non_intersection_nodes     #500 seconds
rake graph_seed:delete_neighbor_relationships     #60 seconds
rake graph_seed:write_intersects_csv              #160 seconds
rake graph_seed:create_nodes_from_csv             #1775 seconds
rake graph_seed:create_relationships_from_csv     #7400 seconds
```