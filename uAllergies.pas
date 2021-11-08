unit uAllergies;

interface
  uses
    System.Generics.Collections;

  type IAllergies = interface
    function AllergicTo(AAllergenName : string) : boolean;
    function List : TList<string>;
  end;

  type TAllergies = class(TInterfacedObject, IAllergies)
    constructor Create(AAllergyScore : integer); overload;
    destructor Destroy; override;
    function AllergicTo(AAllergenName : string) : boolean;
    function List : TList<string>;
  private
    FAllergenList : TList<string>;
  end;

implementation

  constructor TAllergies.Create(AAllergyScore : integer);
    begin
      self.FAllergenList := TList<string>.Create;
      while 255 < AAllergyScore do
        AAllergyScore := AAllergyScore mod 256;
      while 0 < AAllergyScore do
        begin
          if 127 < AAllergyScore then
            begin
              self.FAllergenList.Add('cats');
              AAllergyScore := AAllergyScore - 128;
            end;
          if 63 < AAllergyScore then
            begin
              self.FAllergenList.Add('pollen');
              AAllergyScore := AAllergyScore - 64;
            end;
          if 31 < AAllergyScore then
            begin
              self.FAllergenList.Add('chocolate');
              AAllergyScore := AAllergyScore - 32;
            end;
          if 15 < AAllergyScore then
            begin
              self.FAllergenList.Add('tomatoes');
              AAllergyScore := AAllergyScore - 16;
            end;
          if 7 < AAllergyScore then
            begin
              self.FAllergenList.Add('strawberries');
              AAllergyScore := AAllergyScore - 8;
            end;
          if 3 < AAllergyScore then
            begin
              self.FAllergenList.Add('shellfish');
              AAllergyScore := AAllergyScore - 4;
            end;
          if 1 < AAllergyScore then
            begin
              self.FAllergenList.Add('peanuts');
              AAllergyScore := AAllergyScore - 2;
            end;
          if 0 < AAllergyScore then
            begin
              self.FAllergenList.Add('eggs');
              AAllergyScore := AAllergyScore - 1;
            end;
        end;
    end;

  function TAllergies.AllergicTo(AAllergenName : string) : boolean;
    begin
      Result := self.FAllergenList.Contains(AAllergenName);
    end;

  function TAllergies.List : TList<string>;
    begin
      Result := self.FAllergenList;
    end;

  destructor TAllergies.Destroy;
    begin
      self.FAllergenList.Free;
    end;
end.
