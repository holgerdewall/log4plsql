set serveroutput on
declare
ctx PLOGPARAM.LOG_CTX  := plog.init('de.alldewall');
v_out varchar2(100);
x varchar2(5);
begin
  x := 'Hello World';
  select 'test' into v_out from dual where 1 = 0;
  plog.info(ctx, x || ', with success');
  exception
  when others then
  plog.error(ctx, sqlcode);
  plog.full_error_backtrace(ctx);
end;
/
