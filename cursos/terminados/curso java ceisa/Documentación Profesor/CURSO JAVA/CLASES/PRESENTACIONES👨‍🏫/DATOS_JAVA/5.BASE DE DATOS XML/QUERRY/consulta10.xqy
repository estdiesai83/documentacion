let $iteam :=(1,2,3,4,5,6)
let $sub-iteam :=subsequence($iteam,2,5)
let $lastElemento :=$iteam[last()]
let $new-iteam := reverse($iteam)


return
  <resultado>
          <ultimo>{$lastElemento}</ultimo>
       <items>
          {
            for $item in $sub-iteam
            return<iteam>{$item}</iteam>
            
          }
       
       
       </items>
       
       <iteam2>  
       {
         for $item1 in $new-iteam
         return<item>{$item1}</item>
         
         
         
       }
       
       
       
       </iteam2>
       
  
  
  
  </resultado>
  