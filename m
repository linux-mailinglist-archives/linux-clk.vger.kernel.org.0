Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5A89A15F493
	for <lists+linux-clk@lfdr.de>; Fri, 14 Feb 2020 19:24:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394821AbgBNSVt (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 14 Feb 2020 13:21:49 -0500
Received: from outils.crapouillou.net ([89.234.176.41]:39330 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388639AbgBNSVq (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 14 Feb 2020 13:21:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1581704502; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=6Yrvm+Eko/HXkAsAy3GEQjpJsxcgcmbFj3L1odm54lA=;
        b=vfRLTDxeniXGXgrfqM24rt0mNF4UOzEH2JHtZOUewV0TZi64YrQNGipTKkF1XRFvQ+W6Q3
        ZZPkOQfe52LR7hgOaqgwMoVENCq54/eGTH2ABE/ozmaj8mSwpb7OsQudCRLliVlgR6LaJe
        F23OtUBlQ80xSCZ0xXggtpUQ/8v0EGk=
Date:   Fri, 14 Feb 2020 15:21:16 -0300
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v4 1/6] MIPS: JZ4780: Introduce SMP support.
To:     =?UTF-8?b?5ZGo55Cw5p2w?= "(Zhou Yanjie)" 
        <zhouyanjie@wanyeetech.com>
Cc:     linux-mips@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com, ralf@linux-mips.org, paulburton@kernel.org,
        jiaxun.yang@flygoat.com, chenhc@lemote.com, allison@lohutok.net,
        tglx@linutronix.de, daniel.lezcano@linaro.org,
        geert+renesas@glider.be, krzk@kernel.org, keescook@chromium.org,
        ebiederm@xmission.com, miquel.raynal@bootlin.com,
        paul@boddie.org.uk, hns@goldelico.com, sernia.zhou@foxmail.com,
        zhenwenjin@gmail.com, mips-creator-ci20-dev@googlegroups.com,
        1326991897@qq.com
Message-Id: <1581704476.3.0@crapouillou.net>
In-Reply-To: <1581703360-112557-3-git-send-email-zhouyanjie@wanyeetech.com>
References: <1581703360-112557-1-git-send-email-zhouyanjie@wanyeetech.com>
        <1581703360-112557-3-git-send-email-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Zhou,

The changes to drivers/clk/ingenic/jz4780-cgu.c look sound but they=20
really don't belong in this patch.

Please split them to another patch.

-Paul


Le sam., f=C3=A9vr. 15, 2020 at 02:02, =E5=91=A8=E7=90=B0=E6=9D=B0 (Zhou Ya=
njie)=20
<zhouyanjie@wanyeetech.com> a =C3=A9crit :
> Forward port smp support from kernel 3.18.3 of CI20_linux
> to upstream kernel 5.5.
>=20
> Tested-by: H. Nikolaus Schaller <hns@goldelico.com>
> Tested-by: Paul Boddie <paul@boddie.org.uk>
> Signed-off-by: =E5=91=A8=E7=90=B0=E6=9D=B0 (Zhou Yanjie) <zhouyanjie@wany=
eetech.com>
> ---
>=20
> Notes:
>     v1->v2:
>     1.Remove unnecessary "plat_irq_dispatch(void)" in irq-ingenic.c.
>     2.Add a timeout check for "jz4780_boot_secondary()" to avoid a=20
> dead loop.
>     3.Replace hard code in smp.c with macro.
>=20
>     v2->v3:
>     1.Remove unnecessary "extern void (*r4k_blast_dcache)(void)" in=20
> smp.c.
>     2.Use "for_each_of_cpu_node" instead "for_each_compatible_node"=20
> in smp.c.
>     3.Use "of_cpu_node_to_id" instead "of_property_read_u32_index" in=20
> smp.c.
>     4.Move LCR related operations to jz4780-cgu.c.
>=20
>     v3->v4:
>     Rebase on top of kernel 5.6-rc1.
>=20
>  arch/mips/include/asm/mach-jz4740/jz4780-smp.h |  91 ++++++++
>  arch/mips/jz4740/Kconfig                       |   3 +
>  arch/mips/jz4740/Makefile                      |   5 +
>  arch/mips/jz4740/prom.c                        |   4 +
>  arch/mips/jz4740/smp-entry.S                   |  57 +++++
>  arch/mips/jz4740/smp.c                         | 286=20
> +++++++++++++++++++++++++
>  arch/mips/kernel/idle.c                        |  14 +-
>  drivers/clk/ingenic/jz4780-cgu.c               |  58 ++++-
>  8 files changed, 512 insertions(+), 6 deletions(-)
>  create mode 100644 arch/mips/include/asm/mach-jz4740/jz4780-smp.h
>  create mode 100644 arch/mips/jz4740/smp-entry.S
>  create mode 100644 arch/mips/jz4740/smp.c
>=20
> diff --git a/arch/mips/include/asm/mach-jz4740/jz4780-smp.h=20
> b/arch/mips/include/asm/mach-jz4740/jz4780-smp.h
> new file mode 100644
> index 00000000..3f592ce
> --- /dev/null
> +++ b/arch/mips/include/asm/mach-jz4740/jz4780-smp.h
> @@ -0,0 +1,91 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + *  Copyright (C) 2013, Paul Burton <paul.burton@imgtec.com>
> + *  JZ4780 SMP definitions
> + */
> +
> +#ifndef __MIPS_ASM_MACH_JZ4740_JZ4780_SMP_H__
> +#define __MIPS_ASM_MACH_JZ4740_JZ4780_SMP_H__
> +
> +#define read_c0_corectrl()		__read_32bit_c0_register($12, 2)
> +#define write_c0_corectrl(val)		__write_32bit_c0_register($12, 2,=20
> val)
> +
> +#define read_c0_corestatus()		__read_32bit_c0_register($12, 3)
> +#define write_c0_corestatus(val)	__write_32bit_c0_register($12, 3,=20
> val)
> +
> +#define read_c0_reim()			__read_32bit_c0_register($12, 4)
> +#define write_c0_reim(val)		__write_32bit_c0_register($12, 4, val)
> +
> +#define read_c0_mailbox0()		__read_32bit_c0_register($20, 0)
> +#define write_c0_mailbox0(val)		__write_32bit_c0_register($20, 0,=20
> val)
> +
> +#define read_c0_mailbox1()		__read_32bit_c0_register($20, 1)
> +#define write_c0_mailbox1(val)		__write_32bit_c0_register($20, 1,=20
> val)
> +
> +#define smp_clr_pending(mask) do {		\
> +		unsigned int stat;		\
> +		stat =3D read_c0_corestatus();	\
> +		stat &=3D ~((mask) & 0xff);	\
> +		write_c0_corestatus(stat);	\
> +	} while (0)
> +
> +/*
> + * Core Control register
> + */
> +#define CORECTRL_SLEEP1M_SHIFT	17
> +#define CORECTRL_SLEEP1M	(_ULCAST_(0x1) << CORECTRL_SLEEP1M_SHIFT)
> +#define CORECTRL_SLEEP0M_SHIFT	16
> +#define CORECTRL_SLEEP0M	(_ULCAST_(0x1) << CORECTRL_SLEEP0M_SHIFT)
> +#define CORECTRL_RPC1_SHIFT	9
> +#define CORECTRL_RPC1		(_ULCAST_(0x1) << CORECTRL_RPC1_SHIFT)
> +#define CORECTRL_RPC0_SHIFT	8
> +#define CORECTRL_RPC0		(_ULCAST_(0x1) << CORECTRL_RPC0_SHIFT)
> +#define CORECTRL_SWRST1_SHIFT	1
> +#define CORECTRL_SWRST1		(_ULCAST_(0x1) << CORECTRL_SWRST1_SHIFT)
> +#define CORECTRL_SWRST0_SHIFT	0
> +#define CORECTRL_SWRST0		(_ULCAST_(0x1) << CORECTRL_SWRST0_SHIFT)
> +
> +/*
> + * Core Status register
> + */
> +#define CORESTATUS_SLEEP1_SHIFT	17
> +#define CORESTATUS_SLEEP1	(_ULCAST_(0x1) << CORESTATUS_SLEEP1_SHIFT)
> +#define CORESTATUS_SLEEP0_SHIFT	16
> +#define CORESTATUS_SLEEP0	(_ULCAST_(0x1) << CORESTATUS_SLEEP0_SHIFT)
> +#define CORESTATUS_IRQ1P_SHIFT	9
> +#define CORESTATUS_IRQ1P	(_ULCAST_(0x1) << CORESTATUS_IRQ1P_SHIFT)
> +#define CORESTATUS_IRQ0P_SHIFT	8
> +#define CORESTATUS_IRQ0P	(_ULCAST_(0x1) << CORESTATUS_IRQ8P_SHIFT)
> +#define CORESTATUS_MIRQ1P_SHIFT	1
> +#define CORESTATUS_MIRQ1P	(_ULCAST_(0x1) << CORESTATUS_MIRQ1P_SHIFT)
> +#define CORESTATUS_MIRQ0P_SHIFT	0
> +#define CORESTATUS_MIRQ0P	(_ULCAST_(0x1) << CORESTATUS_MIRQ0P_SHIFT)
> +
> +/*
> + * Reset Entry & IRQ Mask register
> + */
> +#define REIM_ENTRY_SHIFT	16
> +#define REIM_ENTRY		(_ULCAST_(0xffff) << REIM_ENTRY_SHIFT)
> +#define REIM_IRQ1M_SHIFT	9
> +#define REIM_IRQ1M		(_ULCAST_(0x1) << REIM_IRQ1M_SHIFT)
> +#define REIM_IRQ0M_SHIFT	8
> +#define REIM_IRQ0M		(_ULCAST_(0x1) << REIM_IRQ0M_SHIFT)
> +#define REIM_MBOXIRQ1M_SHIFT	1
> +#define REIM_MBOXIRQ1M		(_ULCAST_(0x1) << REIM_MBOXIRQ1M_SHIFT)
> +#define REIM_MBOXIRQ0M_SHIFT	0
> +#define REIM_MBOXIRQ0M		(_ULCAST_(0x1) << REIM_MBOXIRQ0M_SHIFT)
> +
> +#ifdef CONFIG_SMP
> +
> +extern void jz4780_smp_wait_irqoff(void);
> +
> +extern void jz4780_smp_init(void);
> +extern void jz4780_secondary_cpu_entry(void);
> +
> +#else /* !CONFIG_SMP */
> +
> +static inline void jz4780_smp_init(void) { }
> +
> +#endif /* !CONFIG_SMP */
> +
> +#endif /* __MIPS_ASM_MACH_JZ4740_JZ4780_SMP_H__ */
> diff --git a/arch/mips/jz4740/Kconfig b/arch/mips/jz4740/Kconfig
> index 412d2fa..0239597 100644
> --- a/arch/mips/jz4740/Kconfig
> +++ b/arch/mips/jz4740/Kconfig
> @@ -34,9 +34,12 @@ config MACH_JZ4770
>=20
>  config MACH_JZ4780
>  	bool
> +	select GENERIC_CLOCKEVENTS_BROADCAST if SMP
>  	select MIPS_CPU_SCACHE
> +	select NR_CPUS_DEFAULT_2
>  	select SYS_HAS_CPU_MIPS32_R2
>  	select SYS_SUPPORTS_HIGHMEM
> +	select SYS_SUPPORTS_SMP
>=20
>  config MACH_X1000
>  	bool
> diff --git a/arch/mips/jz4740/Makefile b/arch/mips/jz4740/Makefile
> index 6de14c0..0a0f024 100644
> --- a/arch/mips/jz4740/Makefile
> +++ b/arch/mips/jz4740/Makefile
> @@ -12,3 +12,8 @@ CFLAGS_setup.o =3D=20
> -I$(src)/../../../scripts/dtc/libfdt
>  # PM support
>=20
>  obj-$(CONFIG_PM) +=3D pm.o
> +
> +# SMP support
> +
> +obj-$(CONFIG_SMP) +=3D smp.o
> +obj-$(CONFIG_SMP) +=3D smp-entry.o
> diff --git a/arch/mips/jz4740/prom.c b/arch/mips/jz4740/prom.c
> index ff4555c..a79159e 100644
> --- a/arch/mips/jz4740/prom.c
> +++ b/arch/mips/jz4740/prom.c
> @@ -8,10 +8,14 @@
>=20
>  #include <asm/bootinfo.h>
>  #include <asm/fw/fw.h>
> +#include <asm/mach-jz4740/jz4780-smp.h>
>=20
>  void __init prom_init(void)
>  {
>  	fw_init_cmdline();
> +#if defined(CONFIG_MACH_JZ4780) && defined(CONFIG_SMP)
> +	jz4780_smp_init();
> +#endif
>  }
>=20
>  void __init prom_free_prom_memory(void)
> diff --git a/arch/mips/jz4740/smp-entry.S=20
> b/arch/mips/jz4740/smp-entry.S
> new file mode 100644
> index 00000000..20049a3
> --- /dev/null
> +++ b/arch/mips/jz4740/smp-entry.S
> @@ -0,0 +1,57 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + *  Copyright (C) 2013, Paul Burton <paul.burton@imgtec.com>
> + *  JZ4780 SMP entry point
> + */
> +
> +#include <asm/addrspace.h>
> +#include <asm/asm.h>
> +#include <asm/asmmacro.h>
> +#include <asm/cacheops.h>
> +#include <asm/mipsregs.h>
> +
> +#define CACHE_SIZE (32 * 1024)
> +#define CACHE_LINESIZE 32
> +
> +.extern jz4780_cpu_entry_sp
> +.extern jz4780_cpu_entry_gp
> +
> +.section .text.smp-entry
> +.balign 0x10000
> +.set noreorder
> +LEAF(jz4780_secondary_cpu_entry)
> +	mtc0	zero, CP0_CAUSE
> +
> +	li	t0, ST0_CU0
> +	mtc0	t0, CP0_STATUS
> +
> +	/* cache setup */
> +	li	t0, KSEG0
> +	ori	t1, t0, CACHE_SIZE
> +	mtc0	zero, CP0_TAGLO, 0
> +1:	cache	Index_Store_Tag_I, 0(t0)
> +	cache	Index_Store_Tag_D, 0(t0)
> +	bne	t0, t1, 1b
> +	 addiu	t0, t0, CACHE_LINESIZE
> +
> +	/* kseg0 cache attribute */
> +	mfc0	t0, CP0_CONFIG, 0
> +	ori	t0, t0, CONF_CM_CACHABLE_NONCOHERENT
> +	mtc0	t0, CP0_CONFIG, 0
> +
> +	/* pagemask */
> +	mtc0	zero, CP0_PAGEMASK, 0
> +
> +	/* retrieve sp */
> +	la	t0, jz4780_cpu_entry_sp
> +	lw	sp, 0(t0)
> +
> +	/* retrieve gp */
> +	la	t0, jz4780_cpu_entry_gp
> +	lw	gp, 0(t0)
> +
> +	/* jump to the kernel in kseg0 */
> +	la	t0, smp_bootstrap
> +	jr	t0
> +	 nop
> +	END(jz4780_secondary_cpu_entry)
> diff --git a/arch/mips/jz4740/smp.c b/arch/mips/jz4740/smp.c
> new file mode 100644
> index 00000000..19b75c2
> --- /dev/null
> +++ b/arch/mips/jz4740/smp.c
> @@ -0,0 +1,286 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + *  Copyright (C) 2013, Paul Burton <paul.burton@imgtec.com>
> + *  JZ4780 SMP
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/interrupt.h>
> +#include <linux/of.h>
> +#include <linux/sched.h>
> +#include <linux/sched/task_stack.h>
> +#include <linux/smp.h>
> +#include <linux/tick.h>
> +#include <asm/mach-jz4740/jz4780-smp.h>
> +#include <asm/r4kcache.h>
> +#include <asm/smp-ops.h>
> +
> +static struct clk *cpu_clock_gates[CONFIG_NR_CPUS] =3D { NULL };
> +
> +u32 jz4780_cpu_entry_sp;
> +u32 jz4780_cpu_entry_gp;
> +
> +static struct cpumask cpu_running;
> +
> +static DEFINE_SPINLOCK(smp_lock);
> +
> +/*
> + * The Ingenic jz4780 SMP variant has to write back dirty cache=20
> lines before
> + * executing wait. The CPU & cache clock will be gated until we=20
> return from
> + * the wait, and if another core attempts to access data from our=20
> data cache
> + * during this time then it will lock up.
> + */
> +void jz4780_smp_wait_irqoff(void)
> +{
> +	unsigned long pending =3D read_c0_cause() & read_c0_status() &=20
> CAUSEF_IP;
> +
> +	/*
> +	 * Going to idle has a significant overhead due to the cache flush=20
> so
> +	 * try to avoid it if we'll immediately be woken again due to an=20
> IRQ.
> +	 */
> +	if (!need_resched() && !pending) {
> +		r4k_blast_dcache();
> +
> +		__asm__(
> +		"	.set push	\n"
> +		"	.set mips3	\n"
> +		"	sync		\n"
> +		"	wait		\n"
> +		"	.set pop	\n");
> +	}
> +
> +	local_irq_enable();
> +}
> +
> +static irqreturn_t mbox_handler(int irq, void *dev_id)
> +{
> +	int cpu =3D smp_processor_id();
> +	u32 action, status;
> +
> +	spin_lock(&smp_lock);
> +
> +	switch (cpu) {
> +	case 0:
> +		action =3D read_c0_mailbox0();
> +		write_c0_mailbox0(0);
> +		break;
> +	case 1:
> +		action =3D read_c0_mailbox1();
> +		write_c0_mailbox1(0);
> +		break;
> +	default:
> +		panic("unhandled cpu %d!", cpu);
> +	}
> +
> +	/* clear pending mailbox interrupt */
> +	status =3D read_c0_corestatus();
> +	status &=3D ~(CORESTATUS_MIRQ0P << cpu);
> +	write_c0_corestatus(status);
> +
> +	spin_unlock(&smp_lock);
> +
> +	if (action & SMP_RESCHEDULE_YOURSELF)
> +		scheduler_ipi();
> +	if (action & SMP_CALL_FUNCTION)
> +		generic_smp_call_function_interrupt();
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static struct irqaction mbox_action =3D {
> +	.handler =3D mbox_handler,
> +	.name =3D "core mailbox",
> +	.flags =3D IRQF_PERCPU | IRQF_NO_THREAD,
> +};
> +
> +static void jz4780_smp_setup(void)
> +{
> +	u32 addr, reim;
> +	int cpu;
> +
> +	reim =3D read_c0_reim();
> +
> +	for (cpu =3D 0; cpu < NR_CPUS; cpu++) {
> +		__cpu_number_map[cpu] =3D cpu;
> +		__cpu_logical_map[cpu] =3D cpu;
> +		set_cpu_possible(cpu, true);
> +	}
> +
> +	/* mask mailbox interrupts for this core */
> +	reim &=3D ~REIM_MBOXIRQ0M;
> +	write_c0_reim(reim);
> +
> +	/* clear mailboxes & pending mailbox IRQs */
> +	write_c0_mailbox0(0);
> +	write_c0_mailbox1(0);
> +	write_c0_corestatus(0);
> +
> +	/* set reset entry point */
> +	addr =3D KSEG1ADDR((u32)&jz4780_secondary_cpu_entry);
> +	WARN_ON(addr & ~REIM_ENTRY);
> +	reim &=3D ~REIM_ENTRY;
> +	reim |=3D addr & REIM_ENTRY;
> +
> +	/* unmask mailbox interrupts for this core */
> +	reim |=3D REIM_MBOXIRQ0M;
> +	write_c0_reim(reim);
> +	set_c0_status(STATUSF_IP3);
> +	irq_enable_hazard();
> +
> +	cpumask_set_cpu(cpu, &cpu_running);
> +}
> +
> +static void jz4780_smp_prepare_cpus(unsigned int max_cpus)
> +{
> +	struct device_node *cpu_node;
> +	unsigned cpu, ctrl;
> +	int err;
> +
> +	/* setup the mailbox IRQ */
> +	setup_irq(MIPS_CPU_IRQ_BASE + 3, &mbox_action);
> +
> +	init_cpu_present(cpu_possible_mask);
> +
> +	ctrl =3D read_c0_corectrl();
> +
> +	for (cpu =3D 0; cpu < max_cpus; cpu++) {
> +		/* use reset entry point from REIM register */
> +		ctrl |=3D CORECTRL_RPC0 << cpu;
> +	}
> +
> +	for_each_of_cpu_node(cpu_node) {
> +		cpu =3D of_cpu_node_to_id(cpu_node);
> +		if (cpu < 0) {
> +			pr_err("Failed to read index of %s\n",
> +			       cpu_node->full_name);
> +			continue;
> +		}
> +
> +		cpu_clock_gates[cpu] =3D of_clk_get(cpu_node, 0);
> +		if (IS_ERR(cpu_clock_gates[cpu])) {
> +			cpu_clock_gates[cpu] =3D NULL;
> +			continue;
> +		}
> +
> +		err =3D clk_prepare(cpu_clock_gates[cpu]);
> +		if (err)
> +			pr_err("Failed to prepare CPU clock gate\n");
> +	}
> +
> +	write_c0_corectrl(ctrl);
> +}
> +
> +static int jz4780_boot_secondary(int cpu, struct task_struct *idle)
> +{
> +	unsigned long flags;
> +	u32 ctrl;
> +
> +	spin_lock_irqsave(&smp_lock, flags);
> +
> +	/* ensure the core is in reset */
> +	ctrl =3D read_c0_corectrl();
> +	ctrl |=3D CORECTRL_SWRST0 << cpu;
> +	write_c0_corectrl(ctrl);
> +
> +	/* ungate core clock */
> +	if (cpu_clock_gates[cpu])
> +		clk_enable(cpu_clock_gates[cpu]);
> +
> +	/* set entry sp/gp register values */
> +	jz4780_cpu_entry_sp =3D __KSTK_TOS(idle);
> +	jz4780_cpu_entry_gp =3D (u32)task_thread_info(idle);
> +	smp_wmb();
> +
> +	/* take the core out of reset */
> +	ctrl &=3D ~(CORECTRL_SWRST0 << cpu);
> +	write_c0_corectrl(ctrl);
> +
> +	cpumask_set_cpu(cpu, &cpu_running);
> +
> +	spin_unlock_irqrestore(&smp_lock, flags);
> +
> +	return 0;
> +}
> +
> +static void jz4780_init_secondary(void)
> +{
> +}
> +
> +static void jz4780_smp_finish(void)
> +{
> +	u32 reim;
> +
> +	spin_lock(&smp_lock);
> +
> +	/* unmask mailbox interrupts for this core */
> +	reim =3D read_c0_reim();
> +	reim |=3D REIM_MBOXIRQ0M << smp_processor_id();
> +	write_c0_reim(reim);
> +
> +	spin_unlock(&smp_lock);
> +
> +	/* unmask interrupts for this core */
> +	change_c0_status(ST0_IM, STATUSF_IP3 | STATUSF_IP2 |
> +			 STATUSF_IP1 | STATUSF_IP0);
> +	irq_enable_hazard();
> +
> +	/* force broadcast timer */
> +	tick_broadcast_force();
> +}
> +
> +static void jz4780_send_ipi_single_locked(int cpu, unsigned int=20
> action)
> +{
> +	u32 mbox;
> +
> +	switch (cpu) {
> +	case 0:
> +		mbox =3D read_c0_mailbox0();
> +		write_c0_mailbox0(mbox | action);
> +		break;
> +	case 1:
> +		mbox =3D read_c0_mailbox1();
> +		write_c0_mailbox1(mbox | action);
> +		break;
> +	default:
> +		panic("unhandled cpu %d!", cpu);
> +	}
> +}
> +
> +static void jz4780_send_ipi_single(int cpu, unsigned int action)
> +{
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&smp_lock, flags);
> +	jz4780_send_ipi_single_locked(cpu, action);
> +	spin_unlock_irqrestore(&smp_lock, flags);
> +}
> +
> +static void jz4780_send_ipi_mask(const struct cpumask *mask,
> +				 unsigned int action)
> +{
> +	unsigned long flags;
> +	int cpu;
> +
> +	spin_lock_irqsave(&smp_lock, flags);
> +
> +	for_each_cpu(cpu, mask)
> +		jz4780_send_ipi_single_locked(cpu, action);
> +
> +	spin_unlock_irqrestore(&smp_lock, flags);
> +}
> +
> +static struct plat_smp_ops jz4780_smp_ops =3D {
> +	.send_ipi_single =3D jz4780_send_ipi_single,
> +	.send_ipi_mask =3D jz4780_send_ipi_mask,
> +	.init_secondary =3D jz4780_init_secondary,
> +	.smp_finish =3D jz4780_smp_finish,
> +	.boot_secondary =3D jz4780_boot_secondary,
> +	.smp_setup =3D jz4780_smp_setup,
> +	.prepare_cpus =3D jz4780_smp_prepare_cpus,
> +};
> +
> +void jz4780_smp_init(void)
> +{
> +	register_smp_ops(&jz4780_smp_ops);
> +}
> diff --git a/arch/mips/kernel/idle.c b/arch/mips/kernel/idle.c
> index 37f8e78..a406de3 100644
> --- a/arch/mips/kernel/idle.c
> +++ b/arch/mips/kernel/idle.c
> @@ -19,6 +19,10 @@
>  #include <asm/idle.h>
>  #include <asm/mipsregs.h>
>=20
> +#ifdef CONFIG_MACH_JZ4780
> +# include <asm/mach-jz4740/jz4780-smp.h>
> +#endif
> +
>  /*
>   * Not all of the MIPS CPUs have the "wait" instruction available.=20
> Moreover,
>   * the implementation of the "wait" feature differs between CPU=20
> families. This
> @@ -172,7 +176,6 @@ void __init check_wait(void)
>  	case CPU_CAVIUM_OCTEON_PLUS:
>  	case CPU_CAVIUM_OCTEON2:
>  	case CPU_CAVIUM_OCTEON3:
> -	case CPU_XBURST:
>  	case CPU_LOONGSON32:
>  	case CPU_XLR:
>  	case CPU_XLP:
> @@ -246,6 +249,15 @@ void __init check_wait(void)
>  		   cpu_wait =3D r4k_wait;
>  		 */
>  		break;
> +	case CPU_XBURST:
> +#if defined(CONFIG_MACH_JZ4780) && defined(CONFIG_SMP)
> +		if (NR_CPUS > 1)
> +			cpu_wait =3D jz4780_smp_wait_irqoff;
> +		else
> +			cpu_wait =3D r4k_wait;
> +#else
> +		cpu_wait =3D r4k_wait;
> +#endif
>  	default:
>  		break;
>  	}
> diff --git a/drivers/clk/ingenic/jz4780-cgu.c=20
> b/drivers/clk/ingenic/jz4780-cgu.c
> index d07fff1..4f81819 100644
> --- a/drivers/clk/ingenic/jz4780-cgu.c
> +++ b/drivers/clk/ingenic/jz4780-cgu.c
> @@ -16,7 +16,7 @@
>=20
>  /* CGU register offsets */
>  #define CGU_REG_CLOCKCONTROL	0x00
> -#define CGU_REG_PLLCONTROL	0x0c
> +#define CGU_REG_LCR			0x04
>  #define CGU_REG_APLL		0x10
>  #define CGU_REG_MPLL		0x14
>  #define CGU_REG_EPLL		0x18
> @@ -46,8 +46,8 @@
>  #define CGU_REG_CLOCKSTATUS	0xd4
>=20
>  /* bits within the OPCR register */
> -#define OPCR_SPENDN0		(1 << 7)
> -#define OPCR_SPENDN1		(1 << 6)
> +#define OPCR_SPENDN0		BIT(7)
> +#define OPCR_SPENDN1		BIT(6)
>=20
>  /* bits within the USBPCR register */
>  #define USBPCR_USB_MODE		BIT(31)
> @@ -88,6 +88,13 @@
>  #define USBVBFIL_IDDIGFIL_MASK	(0xffff << USBVBFIL_IDDIGFIL_SHIFT)
>  #define USBVBFIL_USBVBFIL_MASK	(0xffff)
>=20
> +/* bits within the LCR register */
> +#define LCR_PD_SCPU			BIT(31)
> +#define LCR_SCPUS			BIT(27)
> +
> +/* bits within the CLKGR1 register */
> +#define CLKGR1_CORE1		BIT(15)
> +
>  static struct ingenic_cgu *cgu;
>=20
>  static u8 jz4780_otg_phy_get_parent(struct clk_hw *hw)
> @@ -205,6 +212,47 @@ static const struct clk_ops jz4780_otg_phy_ops =3D=20
> {
>  	.set_rate =3D jz4780_otg_phy_set_rate,
>  };
>=20
> +static int jz4780_core1_enable(struct clk_hw *hw)
> +{
> +	struct ingenic_clk *ingenic_clk =3D to_ingenic_clk(hw);
> +	struct ingenic_cgu *cgu =3D ingenic_clk->cgu;
> +	const unsigned int timeout =3D 100;
> +	unsigned long flags;
> +	unsigned int i;
> +	u32 lcr, clkgr1;
> +
> +	spin_lock_irqsave(&cgu->lock, flags);
> +
> +	lcr =3D readl(cgu->base + CGU_REG_LCR);
> +	lcr &=3D ~LCR_PD_SCPU;
> +	writel(lcr, cgu->base + CGU_REG_LCR);
> +
> +	clkgr1 =3D readl(cgu->base + CGU_REG_CLKGR1);
> +	clkgr1 &=3D ~CLKGR1_CORE1;
> +	writel(clkgr1, cgu->base + CGU_REG_CLKGR1);
> +
> +	spin_unlock_irqrestore(&cgu->lock, flags);
> +
> +	/* wait for the CPU to be powered up */
> +	for (i =3D 0; i < timeout; i++) {
> +		lcr =3D readl(cgu->base + CGU_REG_LCR);
> +		if (!(lcr & LCR_SCPUS))
> +			break;
> +		mdelay(1);
> +	}
> +
> +	if (i =3D=3D timeout) {
> +		pr_err("%s: Wait for power up core1 timeout\n", __func__);
> +		return -EBUSY;
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct clk_ops jz4780_core1_ops =3D {
> +	.enable =3D jz4780_core1_enable,
> +};
> +
>  static const s8 pll_od_encoding[16] =3D {
>  	0x0, 0x1, 0x2, 0x3, 0x4, 0x5, 0x6, 0x7,
>  	0x8, 0x9, 0xa, 0xb, 0xc, 0xd, 0xe, 0xf,
> @@ -701,9 +749,9 @@ static const struct ingenic_cgu_clk_info=20
> jz4780_cgu_clocks[] =3D {
>  	},
>=20
>  	[JZ4780_CLK_CORE1] =3D {
> -		"core1", CGU_CLK_GATE,
> +		"core1", CGU_CLK_CUSTOM,
>  		.parents =3D { JZ4780_CLK_CPU, -1, -1, -1 },
> -		.gate =3D { CGU_REG_CLKGR1, 15 },
> +		.custom =3D { &jz4780_core1_ops },
>  	},
>=20
>  };
> --
> 2.7.4
>=20

=

