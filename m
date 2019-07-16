Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 64D336A243
	for <lists+linux-clk@lfdr.de>; Tue, 16 Jul 2019 08:35:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726420AbfGPGfj (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 16 Jul 2019 02:35:39 -0400
Received: from hqemgate14.nvidia.com ([216.228.121.143]:14231 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725783AbfGPGfj (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 16 Jul 2019 02:35:39 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d2d70360002>; Mon, 15 Jul 2019 23:35:34 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Mon, 15 Jul 2019 23:35:34 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Mon, 15 Jul 2019 23:35:34 -0700
Received: from [10.2.164.12] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 16 Jul
 2019 06:35:32 +0000
Subject: Re: [PATCH V5 11/18] clk: tegra210: Add support for Tegra210 clocks
To:     Dmitry Osipenko <digetx@gmail.com>
CC:     <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <tglx@linutronix.de>, <jason@lakedaemon.net>,
        <marc.zyngier@arm.com>, <linus.walleij@linaro.org>,
        <stefan@agner.ch>, <mark.rutland@arm.com>,
        <pdeschrijver@nvidia.com>, <pgaikwad@nvidia.com>,
        <sboyd@kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <jckuo@nvidia.com>,
        <josephl@nvidia.com>, <talho@nvidia.com>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <mperttunen@nvidia.com>, <spatra@nvidia.com>, <robh+dt@kernel.org>,
        <devicetree@vger.kernel.org>
References: <1561687972-19319-1-git-send-email-skomatineni@nvidia.com>
 <1561687972-19319-12-git-send-email-skomatineni@nvidia.com>
 <a5e1a6df-dff7-9e0c-9551-f78103a5462f@gmail.com>
 <a9b5c364-52b4-bee1-5881-47197f043950@nvidia.com>
 <e9d4bc0e-fd5d-ae02-2d67-86c7f7c9620f@gmail.com>
 <3938092a-bbc7-b304-641d-31677539598d@nvidia.com>
 <932d4d50-120c-9191-6a9a-23bf9c96633b@nvidia.com>
 <0ee055ad-d397-32e5-60ee-d62c14c6f77b@gmail.com>
 <86fc07d5-ab2e-a52a-a570-b1dfff4c20fe@nvidia.com>
 <20190716083701.225f0fd9@dimatab>
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <21266e4f-16b1-4c87-067a-16c07c803b6e@nvidia.com>
Date:   Mon, 15 Jul 2019 23:35:31 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190716083701.225f0fd9@dimatab>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1563258935; bh=7I1BiSKz5Dr4/NVo0+z7CzQJ+arGRQAE6MgZ30BXnxM=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=VKHy7iHp/ws74FYkgG7z6Riyc9wPyEihylXcdzdsC3D261Ri23pWVHcLgU8G/2Lxr
         w51Y9EnN2rrYyKON24LnUExxyzAEopgFnzeSy6z9gpFPVeEJzSzTEmEou9mb5UGco1
         Jg4qOIC+kQVObgydf/AD2k6LTsAo88CMvCB4HguEdc0gC38u8p31sdrvg7YisXlMON
         RW76Wo6G/ezdsfTcOwnVxIQaJ2ZC0N1FTHl7F5QBMK2nA4y9hr3UnNDHJgkx4V/s2L
         lIgUhUrEen6pNmNOeL5N+gQ5rfCLcMRVK+QhleoVnBgXD7c9qNiLd/lh4WQa/W5q+2
         SfYAQUKHeXmmQ==
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


On 7/15/19 10:37 PM, Dmitry Osipenko wrote:
> =D0=92 Mon, 15 Jul 2019 21:37:09 -0700
> Sowjanya Komatineni <skomatineni@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5=D1=
=82:
>
>> On 7/15/19 8:50 PM, Dmitry Osipenko wrote:
>>> 16.07.2019 6:00, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>> On 7/15/19 5:35 PM, Sowjanya Komatineni wrote:
>>>>> On 7/14/19 2:41 PM, Dmitry Osipenko wrote:
>>>>>> 13.07.2019 8:54, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>>>>> On 6/29/19 8:10 AM, Dmitry Osipenko wrote:
>>>>>>>> 28.06.2019 5:12, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=
=82:
>>>>>>>>> This patch adds system suspend and resume support for Tegra210
>>>>>>>>> clocks.
>>>>>>>>>
>>>>>>>>> All the CAR controller settings are lost on suspend when core
>>>>>>>>> power goes off.
>>>>>>>>>
>>>>>>>>> This patch has implementation for saving and restoring all
>>>>>>>>> the PLLs and clocks context during system suspend and resume
>>>>>>>>> to have the clocks back to same state for normal operation.
>>>>>>>>>
>>>>>>>>> Acked-by: Thierry Reding <treding@nvidia.com>
>>>>>>>>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>>>>>>>>> ---
>>>>>>>>>   =C2=A0=C2=A0 drivers/clk/tegra/clk-tegra210.c | 115
>>>>>>>>> ++++++++++++++++++++++++++++++++++++++-
>>>>>>>>>   =C2=A0=C2=A0 drivers/clk/tegra/clk.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 14 +++++
>>>>>>>>>   =C2=A0=C2=A0 drivers/clk/tegra/clk.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +
>>>>>>>>>   =C2=A0=C2=A0 3 files changed, 127 insertions(+), 3 deletions(-)
>>>>>>>>>
>>>>>>>>> diff --git a/drivers/clk/tegra/clk-tegra210.c
>>>>>>>>> b/drivers/clk/tegra/clk-tegra210.c
>>>>>>>>> index 1c08c53482a5..1b839544e086 100644
>>>>>>>>> --- a/drivers/clk/tegra/clk-tegra210.c
>>>>>>>>> +++ b/drivers/clk/tegra/clk-tegra210.c
>>>>>>>>> @@ -9,10 +9,12 @@
>>>>>>>>>   =C2=A0=C2=A0 #include <linux/clkdev.h>
>>>>>>>>>   =C2=A0=C2=A0 #include <linux/of.h>
>>>>>>>>>   =C2=A0=C2=A0 #include <linux/of_address.h>
>>>>>>>>> +#include <linux/of_platform.h>
>>>>>>>>>   =C2=A0=C2=A0 #include <linux/delay.h>
>>>>>>>>>   =C2=A0=C2=A0 #include <linux/export.h>
>>>>>>>>>   =C2=A0=C2=A0 #include <linux/mutex.h>
>>>>>>>>>   =C2=A0=C2=A0 #include <linux/clk/tegra.h>
>>>>>>>>> +#include <linux/syscore_ops.h>
>>>>>>>>>   =C2=A0=C2=A0 #include <dt-bindings/clock/tegra210-car.h>
>>>>>>>>>   =C2=A0=C2=A0 #include <dt-bindings/reset/tegra210-car.h>
>>>>>>>>>   =C2=A0=C2=A0 #include <linux/iopoll.h>
>>>>>>>>> @@ -20,6 +22,7 @@
>>>>>>>>>   =C2=A0=C2=A0 #include <soc/tegra/pmc.h>
>>>>>>>>>   =C2=A0=C2=A0 =C2=A0 #include "clk.h"
>>>>>>>>> +#include "clk-dfll.h"
>>>>>>>>>   =C2=A0=C2=A0 #include "clk-id.h"
>>>>>>>>>   =C2=A0=C2=A0 =C2=A0 /*
>>>>>>>>> @@ -225,6 +228,7 @@
>>>>>>>>>   =C2=A0=C2=A0 =C2=A0 #define CLK_RST_CONTROLLER_RST_DEV_Y_SET 0x=
2a8
>>>>>>>>>   =C2=A0=C2=A0 #define CLK_RST_CONTROLLER_RST_DEV_Y_CLR 0x2ac
>>>>>>>>> +#define CPU_SOFTRST_CTRL 0x380
>>>>>>>>>   =C2=A0=C2=A0 =C2=A0 #define LVL2_CLK_GATE_OVRA 0xf8
>>>>>>>>>   =C2=A0=C2=A0 #define LVL2_CLK_GATE_OVRC 0x3a0
>>>>>>>>> @@ -2820,6 +2824,7 @@ static int tegra210_enable_pllu(void)
>>>>>>>>>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct tegra_clk_pll_freq_=
table *fentry;
>>>>>>>>>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct tegra_clk_pll pllu;
>>>>>>>>>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u32 reg;
>>>>>>>>> +=C2=A0=C2=A0=C2=A0 int ret;
>>>>>>>>>   =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for (fentry =3D pll=
_u_freq_table; fentry->input_rate;
>>>>>>>>> fentry++) {
>>>>>>>>>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if=
 (fentry->input_rate =3D=3D pll_ref_freq)
>>>>>>>>> @@ -2847,10 +2852,10 @@ static int tegra210_enable_pllu(void)
>>>>>>>>>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fence_udelay(1, clk_base);
>>>>>>>>>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reg |=3D PLL_ENABLE;
>>>>>>>>>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 writel(reg, clk_base + PLL=
U_BASE);
>>>>>>>>> +=C2=A0=C2=A0=C2=A0 fence_udelay(1, clk_base);
>>>>>>>>>   =C2=A0=C2=A0 -=C2=A0=C2=A0=C2=A0 readl_relaxed_poll_timeout_ato=
mic(clk_base +
>>>>>>>>> PLLU_BASE, reg,
>>>>>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reg & PLL_B=
ASE_LOCK, 2, 1000);
>>>>>>>>> -=C2=A0=C2=A0=C2=A0 if (!(reg & PLL_BASE_LOCK)) {
>>>>>>>>> +=C2=A0=C2=A0=C2=A0 ret =3D tegra210_wait_for_mask(&pllu, PLLU_BA=
SE,
>>>>>>>>> PLL_BASE_LOCK);
>>>>>>>>> +=C2=A0=C2=A0=C2=A0 if (ret) {
>>>>>>>>>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pr=
_err("Timed out waiting for PLL_U to lock\n");
>>>>>>>>>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 re=
turn -ETIMEDOUT;
>>>>>>>>>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>>>>>>> @@ -3283,6 +3288,103 @@ static void
>>>>>>>>> tegra210_disable_cpu_clock(u32 cpu)
>>>>>>>>>   =C2=A0=C2=A0 }
>>>>>>>>>   =C2=A0=C2=A0 =C2=A0 #ifdef CONFIG_PM_SLEEP
>>>>>>>>> +static u32 cpu_softrst_ctx[3];
>>>>>>>>> +static struct platform_device *dfll_pdev;
>>>>>>>>> +#define car_readl(_base, _off) readl_relaxed(clk_base +
>>>>>>>>> (_base) + ((_off) * 4))
>>>>>>>>> +#define car_writel(_val, _base, _off) \
>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 writel_relaxed(_val, =
clk_base + (_base) + ((_off) *
>>>>>>>>> 4)) +
>>>>>>>>> +static int tegra210_clk_suspend(void)
>>>>>>>>> +{
>>>>>>>>> +=C2=A0=C2=A0=C2=A0 unsigned int i;
>>>>>>>>> +=C2=A0=C2=A0=C2=A0 struct device_node *node;
>>>>>>>>> +
>>>>>>>>> +=C2=A0=C2=A0=C2=A0 tegra_cclkg_burst_policy_save_context();
>>>>>>>>> +
>>>>>>>>> +=C2=A0=C2=A0=C2=A0 if (!dfll_pdev) {
>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 node =3D of_find_comp=
atible_node(NULL, NULL,
>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 "nvidia,tegra210-dfll");
>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (node)
>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 dfll_pdev =3D of_find_device_by_node(node);
>>>>>>>>> +
>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 of_node_put(node);
>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!dfll_pdev)
>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 pr_err("dfll node not found. no suspend for
>>>>>>>>> dfll\n");
>>>>>>>>> +=C2=A0=C2=A0=C2=A0 }
>>>>>>>>> +
>>>>>>>>> +=C2=A0=C2=A0=C2=A0 if (dfll_pdev)
>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tegra_dfll_suspend(df=
ll_pdev);
>>>>>>>>> +
>>>>>>>>> +=C2=A0=C2=A0=C2=A0 /* Enable PLLP_OUT_CPU after dfll suspend */
>>>>>>>>> +=C2=A0=C2=A0=C2=A0 tegra_clk_set_pllp_out_cpu(true);
>>>>>>>>> +
>>>>>>>>> +=C2=A0=C2=A0=C2=A0 tegra_sclk_cclklp_burst_policy_save_context()=
;
>>>>>>>>> +
>>>>>>>>> +=C2=A0=C2=A0=C2=A0 clk_save_context();
>>>>>>>>> +
>>>>>>>>> +=C2=A0=C2=A0=C2=A0 for (i =3D 0; i < ARRAY_SIZE(cpu_softrst_ctx)=
; i++)
>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cpu_softrst_ctx[i] =
=3D car_readl(CPU_SOFTRST_CTRL, i);
>>>>>>>>> +
>>>>>>>>> +=C2=A0=C2=A0=C2=A0 return 0;
>>>>>>>>> +}
>>>>>>>>> +
>>>>>>>>> +static void tegra210_clk_resume(void)
>>>>>>>>> +{
>>>>>>>>> +=C2=A0=C2=A0=C2=A0 unsigned int i;
>>>>>>>>> +=C2=A0=C2=A0=C2=A0 struct clk_hw *parent;
>>>>>>>>> +=C2=A0=C2=A0=C2=A0 struct clk *clk;
>>>>>>>>> +
>>>>>>>>> +=C2=A0=C2=A0=C2=A0 /*
>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * clk_restore_context restores clocks a=
s per the clock
>>>>>>>>> tree.
>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 *
>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * dfllCPU_out is first in the clock tre=
e to get
>>>>>>>>> restored and it
>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * involves programming DFLL controller =
along with
>>>>>>>>> restoring CPUG
>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * clock burst policy.
>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 *
>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * DFLL programming needs dfll_ref and d=
fll_soc
>>>>>>>>> peripheral clocks
>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * to be restores which are part ofthe p=
eripheral
>>>>>>>>> clocks.
>>>>>>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^ white-space
>>>>>>
>>>>>> Please use spellchecker to avoid typos.
>>>>>>  =20
>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * So, peripheral clocks restore should =
happen prior to
>>>>>>>>> dfll clock
>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * restore.
>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 */
>>>>>>>>> +
>>>>>>>>> +=C2=A0=C2=A0=C2=A0 tegra_clk_osc_resume(clk_base);
>>>>>>>>> +=C2=A0=C2=A0=C2=A0 for (i =3D 0; i < ARRAY_SIZE(cpu_softrst_ctx)=
; i++)
>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 car_writel(cpu_softrs=
t_ctx[i], CPU_SOFTRST_CTRL, i);
>>>>>>>>> +
>>>>>>>>> +=C2=A0=C2=A0=C2=A0 /* restore all plls and peripheral clocks */
>>>>>>>>> +=C2=A0=C2=A0=C2=A0 tegra210_init_pllu();
>>>>>>>>> +=C2=A0=C2=A0=C2=A0 clk_restore_context();
>>>>>>>>> +
>>>>>>>>> +=C2=A0=C2=A0=C2=A0 fence_udelay(5, clk_base);
>>>>>>>>> +
>>>>>>>>> +=C2=A0=C2=A0=C2=A0 /* resume SCLK and CPULP clocks */
>>>>>>>>> +=C2=A0=C2=A0=C2=A0 tegra_sclk_cpulp_burst_policy_restore_context=
();
>>>>>>>>> +
>>>>>>>>> +=C2=A0=C2=A0=C2=A0 /*
>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * restore CPUG clocks:
>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * - enable DFLL in open loop mode
>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * - switch CPUG to DFLL clock source
>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * - close DFLL loop
>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * - sync PLLX state
>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 */
>>>>>>>>> +=C2=A0=C2=A0=C2=A0 if (dfll_pdev)
>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tegra_dfll_resume(dfl=
l_pdev, false);
>>>>>>>>> +
>>>>>>>>> +=C2=A0=C2=A0=C2=A0 tegra_cclkg_burst_policy_restore_context();
>>>>>>>>> +=C2=A0=C2=A0=C2=A0 fence_udelay(2, clk_base);
>>>>>>>>> +
>>>>>>>>> +=C2=A0=C2=A0=C2=A0 if (dfll_pdev)
>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tegra_dfll_resume(dfl=
l_pdev, true);
>>>>>>>>> +
>>>>>>>>> +=C2=A0=C2=A0=C2=A0 parent =3D
>>>>>>>>> clk_hw_get_parent(__clk_get_hw(clks[TEGRA210_CLK_CCLK_G]));
>>>>>>>>> +=C2=A0=C2=A0=C2=A0 clk =3D clks[TEGRA210_CLK_PLL_X];
>>>>>>>>> +=C2=A0=C2=A0=C2=A0 if (parent !=3D __clk_get_hw(clk))
>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tegra_clk_sync_state_=
pll(__clk_get_hw(clk));
>>>>>>>>> +
>>>>>>>>> +=C2=A0=C2=A0=C2=A0 /* Disable PLL_OUT_CPU after DFLL resume */
>>>>>>>>> +=C2=A0=C2=A0=C2=A0 tegra_clk_set_pllp_out_cpu(false);
>>>>>>>>> +}
>>>>>>>>> +
>>>>>>>>>   =C2=A0=C2=A0 static void tegra210_cpu_clock_suspend(void)
>>>>>>>>>   =C2=A0=C2=A0 {
>>>>>>>>>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* switch coresite to clk_=
m, save off original source
>>>>>>>>> */ @@ -3298,6 +3400,11 @@ static void
>>>>>>>>> tegra210_cpu_clock_resume(void) }
>>>>>>>>>   =C2=A0=C2=A0 #endif
>>>>>>>>>   =C2=A0=C2=A0 +static struct syscore_ops tegra_clk_syscore_ops =
=3D {
>>>>>>>>> +=C2=A0=C2=A0=C2=A0 .suspend =3D tegra210_clk_suspend,
>>>>>>>>> +=C2=A0=C2=A0=C2=A0 .resume =3D tegra210_clk_resume,
>>>>>>>>> +};
>>>>>>>>> +
>>>>>>>>>   =C2=A0=C2=A0 static struct tegra_cpu_car_ops tegra210_cpu_car_o=
ps =3D {
>>>>>>>>>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .wait_for_reset=C2=A0=C2=
=A0=C2=A0 =3D tegra210_wait_cpu_in_reset,
>>>>>>>>>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .disable_clock=C2=A0=C2=A0=
=C2=A0 =3D tegra210_disable_cpu_clock,
>>>>>>>>> @@ -3583,5 +3690,7 @@ static void __init
>>>>>>>>> tegra210_clock_init(struct device_node *np)
>>>>>>>>>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tegra210_mbist_clk_init();
>>>>>>>>>   =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tegra_cpu_car_ops =
=3D &tegra210_cpu_car_ops;
>>>>>>>>> +
>>>>>>>>> +=C2=A0=C2=A0=C2=A0 register_syscore_ops(&tegra_clk_syscore_ops);
>>>>>>>>>   =C2=A0=C2=A0 }
>>>>>>>> Is it really worthwhile to use syscore_ops for suspend/resume
>>>>>>>> given that drivers for
>>>>>>>> won't resume before the CLK driver anyway? Are there any other
>>>>>>>> options for CLK
>>>>>>>> suspend/resume?
>>>>>>>>
>>>>>>>> I'm also not sure whether PM runtime API could be used at all
>>>>>>>> in the context of
>>>>>>>> syscore_ops ..
>>>>>>>>
>>>>>>>> Secondly, what about to use generic clk_save_context() /
>>>>>>>> clk_restore_context()
>>>>>>>> helpers for the suspend-resume? It looks to me that some other
>>>>>>>> essential (and proper)
>>>>>>>> platform driver (soc/tegra/? PMC?) should suspend-resume the
>>>>>>>> clocks using the generic
>>>>>>>> CLK Framework API.
>>>>>>> Clock resume should happen very early to restore peripheral and
>>>>>>> cpu clocks very early than peripheral drivers resume happens.
>>>>>> If all peripheral drivers properly requested all of the
>>>>>> necessary clocks and CLK driver was a platform driver, then I
>>>>>> guess the probe should have been naturally ordered. But that's
>>>>>> not very achievable with the currently available infrastructure
>>>>>> in the kernel, so I'm not arguing that the clocks should be
>>>>>> explicitly resumed before the users.
>>>>>>> this patch series uses clk_save_context and clk_restore_context
>>>>>>> for corresponding divider, pll, pllout.. save and restore
>>>>>>> context.
>>>>>> Now I see that indeed this API is utilized in this patch, thank
>>>>>> you for the clarification.
>>>>>>  =20
>>>>>>> But as there is dependency on dfll resume and cpu and pllx
>>>>>>> clocks restore, couldnt use clk_save_context and
>>>>>>> clk_restore_context for dfll.
>>>>>>>
>>>>>>> So implemented recommended dfll resume sequence in main
>>>>>>> Tegra210 clock driver along with invoking
>>>>>>> clk_save_context/clk_restore_context where all other clocks
>>>>>>> save/restore happens as per clock tree traversal.
>>>>>> Could you please clarify what part of peripherals clocks is
>>>>>> required for DFLL's restore? Couldn't DFLL driver be changed to
>>>>>> avoid that quirkness and thus to make DFLL driver suspend/resume
>>>>>> the clock?
>>>>> DFLL source ref_clk and soc_clk need to be restored prior to dfll.
>>>>>
>>>>> I see dfllCPU_out parent to CCLK_G first in the clock tree and
>>>>> dfll_ref and dfll_soc peripheral clocks are not resumed by the
>>>>> time dfll resume happens first.
>>>>>
>>>>> ref_clk and soc_clk source is from pll_p and clock tree has these
>>>>> registered under pll_p which happens later.
>>>>>
>>>>> tegra210_clock_init registers in order plls, peripheral clocks,
>>>>> super_clk init for cclk_g during clock driver probe and dfll
>>>>> probe and register happens later.
>>>>>  =20
>>>> One more thing, CLDVFS peripheral clock enable is also needed to be
>>>> enabled to program DFLL Controller and all peripheral clock
>>>> context is restored only after their PLL sources are restored.
>>>>
>>>> DFLL restore involves dfll source clock resume along with CLDVFS
>>>> periheral clock enable and reset
>>>>  =20
>>> I don't quite see why you can't simply add suspend/resume callbacks
>>> to the CPUFreq driver to:
>>>
>>> On suspend:
>>> 1. Switch CPU to PLLP (or whatever "safe" parent)
>>> 2. Disable/teardown DFLL
>>>
>>> On resume:
>>> 1. Enable/restore DFLL
>>> 2. Switch CPU back to DFLL
>> dfll runtime suspend/resume are already part of dfll_pm_ops. Don't we
>> want to use it for suspend/resume as well?
> Looks like no. Seems runtime PM of that driver is intended solely for
> the DFLL's clk management.
>
>> currently no APIs are shared b/w clk/tegra driver and CPUFreq driver
>> to invoke dfll suspend/resume in CPUFreq driver
>>
> Just add it. Also, please note that CPUFreq driver is optional and thus
> you may need to switch CPU to a safe parent on clk-core suspend as
> well in order to resume properly if CPU was running off unsafe parent
> during boot and CPUFreq driver is disabled in kernel build (or failed
> to load).
OK, Will add to CPUFreq driver...
>
> The other thing that also need attention is that T124 CPUFreq driver
> implicitly relies on DFLL driver to be probed first, which is icky.
>
Should I add check for successful dfll clk register explicitly in=20
CPUFreq driver probe and defer till dfll clk registers?
