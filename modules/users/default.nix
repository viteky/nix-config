{
  den,
  lib,
  ...
}: {
  den.schema.user = {
    classes = lib.mkDefault ["homeManager"];
    includes = [
      den.batteries.define-user
    ];
  };
}
