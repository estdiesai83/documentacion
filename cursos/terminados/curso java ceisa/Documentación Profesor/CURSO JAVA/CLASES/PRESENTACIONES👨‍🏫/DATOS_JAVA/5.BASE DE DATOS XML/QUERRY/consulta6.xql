let $items :=('orange', <apple/>,<fruit type="juicy"/> ,<vehicle type="car">
translado</vehicle>, 1,2,3,'a','b',"abc")
let $count := count($items)
return
<result>
  <count>{$count}</count>
  
 <iteams>
   {
     for $item in $items
     return <item>{$item}</item>
     
   }
 
 </iteams>
 </result>