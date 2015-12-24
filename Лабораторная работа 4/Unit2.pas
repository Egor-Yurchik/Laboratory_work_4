unit Unit2;

interface

uses
  Classes, SysUtils;

type
  Potok = class(TThread)
  private
  ind: integer;
  procedure UpdateLabel;

  protected
    procedure Execute; override;
  end;

implementation

uses Unit1;

procedure POTOK.UpdateLabel;
begin
Form1.Label1.Caption:=IntToStr(Ind);
end;


{ Important: Methods and properties of objects in visual components can only be
  used in a method called using Synchronize, for example,

      Synchronize(UpdateCaption);

  and UpdateCaption could look like,

    procedure Potok.UpdateCaption;
    begin
      Form1.Caption := 'Updated in a thread';
    end; }

{ Potok }

procedure Potok.Execute;
begin
  ind:=1;
  while ind>0 do
    begin
    Synchronize(UpdateLabel);
    Inc(ind);
    if ind>100000 then
    ind:=0;
    if terminated then exit;
    end;

end;
end.
