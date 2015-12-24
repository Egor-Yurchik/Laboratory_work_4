unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Unit2;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    co: Potok;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  pr: boolean;

implementation


{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
   if  pr=false then
      co:=Potok.Create(true);
   co.Resume;
   co.Priority:=tpLower;

end;

procedure TForm1.Button2Click(Sender: TObject);
begin
      co.Terminate;
      co.Free;
      pr:=false;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
      co.Suspend;
      pr:=true;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
      pr:=false;
end;

end.
