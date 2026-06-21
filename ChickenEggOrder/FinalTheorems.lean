import ChickenEggOrder.Questions

namespace ChickenEggOrder

theorem not_ChickenFirst (W : CausalWorld) : ¬ ChickenFirst W := by
  intro h
  unfold ChickenFirst at h
  unfold ClassPrecedes at h
  rcases h with ⟨c, hcChicken, hcBeforeAllEggs⟩

  -- 由鸡的存在性来源公理，取一个孵化这只鸡的蛋 e
  have hExist : ∃ e : W.Entity, W.isEgg e ∧ W.hatches e c := by
    exact W.chicken_has_hatching_egg c hcChicken
  rcases hExist with ⟨e, heEgg, hhatch⟩

  -- 由 hatches_before 得到 e before c
  have heBeforeC : W.before e c := by
    exact W.hatches_before heEgg hcChicken hhatch

  -- 由 ChickenFirst，c 先于所有蛋，所以 c 先于 e
  have hcBeforeE : W.before c e := by
    exact hcBeforeAllEggs e heEgg

  -- 传递性推出 c before c
  have hcBeforeC : W.before c c := by
    exact W.before_trans hcBeforeE heBeforeC

  -- 反自反性矛盾
  exact W.before_irrefl c hcBeforeC

theorem not_EggFirst (W : CausalWorld) : ¬ EggFirst W := by
  intro h
  unfold EggFirst at h
  unfold ClassPrecedes at h
  rcases h with ⟨e, heEgg, heBeforeAllChickens⟩

  -- 由蛋的存在性来源公理，取一个生出这颗蛋的鸡 c
  have hExist : ∃ c : W.Entity, W.isChicken c ∧ W.lays c e := by
    exact W.egg_has_laying_chicken e heEgg
  rcases hExist with ⟨c, hcChicken, hlays⟩

  -- 由 lays_before 得到 c before e
  have hcBeforeE : W.before c e := by
    exact W.lays_before hcChicken heEgg hlays

  -- 由 EggFirst，e 先于所有鸡，所以 e 先于 c
  have heBeforeC : W.before e c := by
    exact heBeforeAllChickens c hcChicken

  -- 传递性推出 e before e
  have heBeforeE : W.before e e := by
    exact W.before_trans heBeforeC hcBeforeE

  -- 反自反性矛盾
  exact W.before_irrefl e heBeforeE

theorem both_not_first (W : CausalWorld) : ¬ ChickenFirst W ∧ ¬ EggFirst W := by
  constructor
  · exact not_ChickenFirst W
  · exact not_EggFirst W

end ChickenEggOrder
