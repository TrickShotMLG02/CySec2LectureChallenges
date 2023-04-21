
main.o:	file format elf32-i386

Disassembly of section .text:

00000000 <start>:
       0: eb 14                        	jmp	0x16 <main>

00000002 <print>:
       2: 50                           	pushl	%eax
       3: 53                           	pushl	%ebx
       4: 56                           	pushl	%esi

00000005 <print.loop>:
       5: ac                           	lodsb	(%esi), %al
       6: 08 c0                        	orb	%al, %al
       8: 74 08                        	je	0x12 <print.done>
       a: b4 0e                        	movb	$14, %ah
       c: b7 00                        	movb	$0, %bh
       e: cd 10                        	int	$16
      10: eb f3                        	jmp	0x5 <print.loop>

00000012 <print.done>:
      12: 58                           	popl	%eax
      13: 5b                           	popl	%ebx
      14: 5e                           	popl	%esi
      15: c3                           	retl

00000016 <main>:
      16: b8 00 00 8e d8               	movl	$3633184768, %eax       # imm = 0xD88E0000
      1b: 8e c0                        	movl	%eax, %es
      1d: 8e d0                        	movl	%eax, %ss
      1f: bc 00 7c be 92               	movl	$2461957120, %esp       # imm = 0x92BE7C00
      24: 00 e8                        	addb	%ch, %al
      26: da ff                        	<unknown>
      28: 31 db                        	xorl	%ebx, %ebx
      2a: b4 10                        	movb	$16, %ah
      2c: ba c0 07 b9 10               	movl	$280561600, %edx        # imm = 0x10B907C0
      31: 00 b4 00 cd 16 3c 0d         	addb	%dh, 222041805(%eax,%eax)

00000032 <input_loop>:
      32: b4 00                        	movb	$0, %ah
      34: cd 16                        	int	$22
      36: 3c 0d                        	cmpb	$13, %al
      38: 74 2b                        	je	0x65 <input_done>
      3a: 83 fb 10                     	cmpl	$16, %ebx
      3d: 73 26                        	jae	0x65 <input_done>
      3f: 3c 08                        	cmpb	$8, %al
      41: 74 0f                        	je	0x52 <backspace>
      43: 3c 20                        	cmpb	$32, %al
      45: 72 eb                        	jb	0x32 <input_loop>
      47: 88 87 00 00 43 b4            	movb	%al, -1270677504(%edi)
      4d: 0e                           	pushl	%cs
      4e: cd 10                        	int	$16
      50: eb e0                        	jmp	0x32 <input_loop>

00000052 <backspace>:
      52: 83 fb 00                     	cmpl	$0, %ebx
      55: 74 db                        	je	0x32 <input_loop>
      57: 4b                           	decl	%ebx
      58: be 52 00 e8 a4               	movl	$2766667858, %esi       # imm = 0xA4E80052
      5d: ff c6                        	incl	%esi
      5f: 87 00                        	xchgl	%eax, (%eax)
      61: 00 00                        	addb	%al, (%eax)
      63: eb cd                        	jmp	0x32 <input_loop>

00000065 <input_done>:
      65: c6 87 00 00 00 e8 95         	movb	$-107, -402653184(%edi)
      6c: ff be 00 00 bf a6            	<unknown>
      72: 00 8a 04 3a 05 75            	addb	%cl, 1963276804(%edx)

00000073 <check_password_loop>:
      73: 8a 04 3a                     	movb	(%edx,%edi), %al
      76: 05 75 0c 46 47               	addl	$1195773045, %eax       # imm = 0x47460C75
      7b: 3c 00                        	cmpb	$0, %al
      7d: 75 f4                        	jne	0x73 <check_password_loop>
      7f: b0 41                        	movb	$65, %al
      81: e6 e9                        	outb	%al, $233
      83: eb 04                        	jmp	0x89 <password_checked>

00000085 <wrong_password>:
      85: b0 58                        	movb	$88, %al
      87: e6 e9                        	outb	%al, $233

00000089 <password_checked>:
      89: be 00 00 e8 73               	movl	$1944584192, %esi       # imm = 0x73E80000
      8e: ff f4                        	pushl	%esp

00000090 <password_checked.halt>:
      90: eb fe                        	jmp	0x90 <password_checked.halt>

00000092 <msg_Promt>:
      92: 45                           	incl	%ebp
      93: 6e                           	outsb	(%esi), %dx
      94: 74 65                        	je	0xfb <correct_password+0x55>
      96: 72 20                        	jb	0xb8 <correct_password+0x12>
      98: 70 61                        	jo	0xfb <correct_password+0x55>
      9a: 73 73                        	jae	0x10f <correct_password+0x69>
      9c: 77 6f                        	ja	0x10d <correct_password+0x67>
      9e: 72 64                        	jb	0x104 <correct_password+0x5e>
      a0: 2e 2e 2e 0d 0a 00 63 61      	orl	$1633878026, %eax       # imm = 0x6163000A

000000a6 <correct_password>:
      a6: 63 61 70                     	arpl	%sp, 112(%ecx)
      a9: 75 74                        	jne	0x11f <correct_password+0x79>
      ab: 64 72 61                     	jb	0x10f <correct_password+0x69>
      ae: 63 6f 6e                     	arpl	%bp, 110(%edi)
      b1: 69 73 00 00 00 00 00         	imull	$0, (%ebx), %esi
		...
     1fc: 00 00                        	addb	%al, (%eax)
     1fe: 55                           	pushl	%ebp
     1ff: aa                           	stosb	%al, %es:(%edi)
