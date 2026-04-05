
let $iteams :=(1,2,3,4,5,6)
let $count := count($iteams)
let $date := current-date()

return
  <result>
     <date>{$date}</date>
     <count>{$count}</count>
     
     <items>
       {
         for $iteam in $iteams[.=(1,2,3,4,5,6)]
         return <item>{$iteam}</item>
         
       }
     </items>

  </result>