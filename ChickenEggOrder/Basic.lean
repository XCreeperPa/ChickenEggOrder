namespace ChickenEggOrder

structure World where
  Entity : Type
  isChicken : Entity → Prop
  isEgg : Entity → Prop
  before : Entity → Entity → Prop
  lays : Entity → Entity → Prop
  hatches : Entity → Entity → Prop

structure StrictWorld extends World where
  before_irrefl : ∀ x : Entity, ¬ before x x
  before_trans : ∀ {x y z : Entity}, before x y → before y z → before x z

structure StrictTotalWorld extends StrictWorld where
  before_total : ∀ x y : Entity, x = y ∨ before x y ∨ before y x

structure CausalWorld extends StrictTotalWorld where
  lays_before : ∀ {c e : Entity}, isChicken c → isEgg e → lays c e → before c e
  hatches_before : ∀ {e c : Entity}, isEgg e → isChicken c → hatches e c → before e c
  lays_type : ∀ {c e : Entity}, lays c e → isChicken c ∧ isEgg e
  hatches_type : ∀ {e c : Entity}, hatches e c → isEgg e ∧ isChicken c
  hatches_unique_chicken : ∀ {e c1 c2 : Entity}, hatches e c1 → hatches e c2 → c1 = c2
  hatches_unique_egg : ∀ {e1 e2 c : Entity}, hatches e1 c → hatches e2 c → e1 = e2
  egg_has_laying_chicken : ∀ e : Entity, isEgg e → ∃ c : Entity, isChicken c ∧ lays c e
  chicken_has_hatching_egg : ∀ c : Entity, isChicken c → ∃ e : Entity, isEgg e ∧ hatches e c

def ClassPrecedes {α : Type} (before : α → α → Prop) (A B : α → Prop) : Prop :=
  ∃ a, (A a) ∧ (∀ b, B b → before a b)

end ChickenEggOrder
