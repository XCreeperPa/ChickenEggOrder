import ChickenEggOrder.Basic

namespace ChickenEggOrder

def ChickenFirst (W : CausalWorld) : Prop :=
  ClassPrecedes W.before W.isChicken W.isEgg

def EggFirst (W : CausalWorld) : Prop :=
  ClassPrecedes W.before W.isEgg W.isChicken

end ChickenEggOrder
