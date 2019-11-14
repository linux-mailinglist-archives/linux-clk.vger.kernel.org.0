Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 58D6AFBD59
	for <lists+linux-clk@lfdr.de>; Thu, 14 Nov 2019 02:16:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726410AbfKNBQQ (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 13 Nov 2019 20:16:16 -0500
Received: from mailout4.samsung.com ([203.254.224.34]:29204 "EHLO
        mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726409AbfKNBQQ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 13 Nov 2019 20:16:16 -0500
Received: from epcas1p3.samsung.com (unknown [182.195.41.47])
        by mailout4.samsung.com (KnoxPortal) with ESMTP id 20191114011608epoutp046fe79ff70db5c9ad5a44daf33f08ef45~W4oI70n2L1433014330epoutp04C
        for <linux-clk@vger.kernel.org>; Thu, 14 Nov 2019 01:16:08 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20191114011608epoutp046fe79ff70db5c9ad5a44daf33f08ef45~W4oI70n2L1433014330epoutp04C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1573694168;
        bh=6x6rJijkqgwDQwsKbx4kGu6bxZmif9pcNf4t+AGcIPo=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=ZA1mnKD6NGnjIeI9ajRmz8dJY2OFEQ1KYAzokH2u0dJ6wbpIKCS7FMkN72QknU1SV
         Sn9na2DHLafAtizMGDwYwPXgrOeu4f0vhU2c9aB98a/sbmR9+7k2WL7fMlzw9GqvZp
         ilhgMJYRuumyiHivWkuXdGW+DaT6/d2iDy1cpqD0=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
        epcas1p2.samsung.com (KnoxPortal) with ESMTP id
        20191114011607epcas1p295fe9e4115a77c0015ff32a02287a827~W4oIDp7UY1782017820epcas1p2A;
        Thu, 14 Nov 2019 01:16:07 +0000 (GMT)
Received: from epsmges1p2.samsung.com (unknown [182.195.40.153]) by
        epsnrtp4.localdomain (Postfix) with ESMTP id 47D3TJ6jbtzMqYkf; Thu, 14 Nov
        2019 01:16:04 +0000 (GMT)
Received: from epcas1p4.samsung.com ( [182.195.41.48]) by
        epsmges1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        D4.01.04135.4DAACCD5; Thu, 14 Nov 2019 10:16:04 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20191114011604epcas1p15b0f0e2fbfc8ef5a4d28e944e15f9549~W4oEz3CW22331223312epcas1p1q;
        Thu, 14 Nov 2019 01:16:04 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20191114011604epsmtrp2e88169f2272c286dc0c86ad2771577c3~W4oEynj8l1269812698epsmtrp2U;
        Thu, 14 Nov 2019 01:16:04 +0000 (GMT)
X-AuditID: b6c32a36-7fbff70000001027-7a-5dccaad4b8b8
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        42.3D.24756.4DAACCD5; Thu, 14 Nov 2019 10:16:04 +0900 (KST)
Received: from [10.113.221.102] (unknown [10.113.221.102]) by
        epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20191114011603epsmtip20e4ee393685109c04d42355ad3c14491~W4oERUE971921719217epsmtip2K;
        Thu, 14 Nov 2019 01:16:03 +0000 (GMT)
Subject: Re: [PATCH v5 4/5] PM / devfreq: Add dynamic scaling for imx8m ddr
 controller
To:     Leonard Crestez <leonard.crestez@nxp.com>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Shawn Guo <shawnguo@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Michael Turquette <mturquette@baylibre.com>,
        =?UTF-8?B?QXJ0dXIgxZp3aWdvxYQ=?= <a.swigon@partner.samsung.com>,
        Saravana Kannan <saravanak@google.com>,
        Angus Ainslie <angus@akkea.ca>,
        Martin Kepplinger <martink@posteo.de>,
        Matthias Kaehlcke <mka@chromium.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Alexandre Bailon <abailon@baylibre.com>,
        Georgi Djakov <georgi.djakov@linaro.org>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        Abel Vesa <abel.vesa@nxp.com>, Jacky Bai <ping.bai@nxp.com>,
        Anson Huang <anson.huang@nxp.com>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
From:   Chanwoo Choi <cw00.choi@samsung.com>
Organization: Samsung Electronics
Message-ID: <b89a5518-6628-3ef4-7e16-827c2fef8f9e@samsung.com>
Date:   Thu, 14 Nov 2019 10:21:49 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
        Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <VI1PR04MB70238C187E23AFAA6DB3281CEE760@VI1PR04MB7023.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset="iso-8859-2"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA01TfUwbZRz2be+ux2LXs4zxjmWO3eIXCdCja/dujkUjzlvEpGaJMzMNnnAp
        hH7Za6fbTETmgFVEt8mEOrZlUgeVZLTrBluoQAfTAWPrPirKEBNwEpUiAoogaNtzSf97fr/3
        eZ7fx5sfKVV2ydLIErOdt5k5I02swC5eeUqVecczoFdN/aNFwasXZGiuvw+gL271AjRbe1mK
        xkaHAWqrL0SnegZx5D0/jKFPAz4CeWovYejGjVYZul7+mww1jUzjyDcWxtF09Q84ci40S9HM
        hz0Aub8NSVC46QiOZlrHAAr1PY+G32si0JeD3QQa6L+Fo0OBHhlyBpcItBz2YmjCn4q8c+wz
        69haZxNgW062AHZq6JCM/awshLGnfQ7W5zlMsPfCHQR7vvFd1htpl7DdkQ4J+9GSil24ksL6
        71ZibI3fA9gZ36M6xZ7SbcU8V8Tb0nlzoaWoxGzIpV/cVfBcgUarYjKZLWgznW7mTHwunZev
        y9xRYoyuh07fyxkd0ZSOEwQ6e/s2m8Vh59OLLYI9l+atRUbrFmuWwJkEh9mQVWgxbWVUqhxN
        lPh6aXFHXR1hPXEBvF3hZMpAuAY4QRIJqU3Q2+vBnWAFqaTaAWz9fUQmBn8A2DsajrOU1J8A
        nml464Fi8tezEpEUAHDaHwRiMAXg5Gx3XJFMvQq/er8Oj+FV1G445K6N20qpkyQMjF+MKx6i
        ygG8v3iQiLEIKgN2TgzFsYLaAO/Oj8Wd5NR2WFFfI4lhjHoMHrx+M+pEkinRCv1znEh5BF6r
        H8diOInSQ3ddIE6XUlnwfp8LE3Eq/H781P/59bBt8oQ01gOk7pCw8/h3IOYJqTx49fJKccxk
        +MvXfpmI0+BMJECI+ABsvtZDiNoqAP2dN3HxQQ073cckIt4ALy02ALHYShiZq8ZFfzmsqlCK
        lI3w9o8jko/BRlfCCK6Etl0JbbsS2j4NMA9YzVsFk4EXGGtO4of7QPx6MrTt4MxgfhBQJKAf
        lnelDOiVOLdX2GcKAkhK6VXyJ83RlLyI27eft1kKbA4jLwSBJrrhI9K0lEJL9BbN9gJGk6NW
        q9EmRqthGDpV/uxZt15JGTg7X8rzVt72QCchk9LKADPw92vvBB8/3Lhf903y4rm8BeVOuLWl
        6oD6qEPR+Il+Z+ivWQVN9HlVTx/PPrd2tGEdq8tezCvo2iOUKSTZ9Uufr1GGQHL1ev6JNdha
        /fy/FZUvrZ7fpQ288tO9zW++bGh7Iwu3mtjIRPnUYO1y/9Fm7e4dt/NfqCxtr/+gvHt59mca
        E4o5JkNqE7j/AHkjAdVTBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA02Sa0hTURzAO7uP3Q2X1+nymFQ0iEprKSgdKEyi8AZFEUEPshx6U2uba9dH
        RdAqM1xlJay2Za3CVyvCLVMrtdxmkO+Zzlflh2lKpSVTKsvILQO//c7//H78z4dDYeIqYjGV
        rspkNSq5QkoK8SqHdNnaLktLYtSQUYDsr5/y0VRzE0ClnY0ATeqfY8gzOABQtTEZmZ1tBLI+
        GcDRzTobiSz6Zzhqb6/go9ZzX/io/P0EgWweN4EmLn8gkG76AYa8V5wAlfS4eMhdfp1A3goP
        QK6mrWjgbDmJHrY1kKiluZNAF+qcfKSzz5Doj9uKo9HKUGSdYuKXMHpdOWAe3XkEmK+9F/jM
        La0LZ+7ashibJZ9k3rlrSeZJ8RnGOl7DYxrGa3nM1ZkoZtohYSq7L+JMQaUFMF7b0l2BB4Qb
        U1hFejarWReXJEyrNRhIddFTcCJPF60F7gKgAwIK0jFw7HMZz8di+gWAWuuef/MweMPViOkA
        NcvB0OHgdEA4q4wBOPItj/A5wfQ+WJ9r8HMIvRc2Tv3GfBJGl1JwpK8H9x0W0FoAr5Z+5/3L
        zRjs+9jlX0fSEfDlaC/p40B6Oez+4fE/SUTHwTxjgd/B6RXwfGsH38eS2XUj1b1zThB8YxzC
        fSygE2GJoc7vY/QamOe9N8ehsH/IPMfLYPVYEXYNhJjm5aZ5iWleYpqX3AW4BYSxak6ZquSi
        1dEqNkfGyZVclipVlpyhtAH/b4pYXQPeFh+2A5oC0gDRK0lLopiQZ3MnlXYAKUwaIlqlmh2J
        UuQnT7GajMOaLAXL2UE4hUtDRcOq1/vFdKo8kz3GsmpW8/+WRwkWa0F+4emDeyT3b23HFAlr
        g2pbG3K6lgQupds/qU/Ihn91LtoxsLLQXrrt56GdgzudUnN4V4w3MnLKMVjUlLaec+o9ZdRu
        R2Hs8QzTEV5HXNCG4BTMHDQp08a29OviLickjDhcm44mhd/ebr9+ekt8QOJCg33zmSZvTPrF
        3Eu2+orHYVKcS5NHR2AaTv4XaLvaL0kDAAA=
X-CMS-MailID: 20191114011604epcas1p15b0f0e2fbfc8ef5a4d28e944e15f9549
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20191112215123epcas5p47d93a1e1837accf16ba0430963d03858
References: <cover.1573595318.git.leonard.crestez@nxp.com>
        <CGME20191112215123epcas5p47d93a1e1837accf16ba0430963d03858@epcas5p4.samsung.com>
        <d33acdcc043ce12713a9279636e32d039da5ee54.1573595319.git.leonard.crestez@nxp.com>
        <0c416a08-811d-f3bc-af37-9e182f7c4d37@samsung.com>
        <6d9ace7b-3177-9bb2-82e6-7ee47f0fdf1c@samsung.com>
        <VI1PR04MB70238C187E23AFAA6DB3281CEE760@VI1PR04MB7023.eurprd04.prod.outlook.com>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 11/13/19 10:10 PM, Leonard Crestez wrote:
> On 13.11.2019 08:23, Chanwoo Choi wrote:
>> On 11/13/19 11:30 AM, Chanwoo Choi wrote:
>>> Hi Leonard,
>>>
>>> On 11/13/19 6:50 AM, Leonard Crestez wrote:
>>>> Add driver for dynamic scaling the DDR Controller on imx8m chips. Actual
>>>> frequency switching is implemented inside TF-A, this driver wraps the
>>>> SMC calls and synchronizes the clk tree.
>>>>
>>>> The DRAM clocks on imx8m have the following structure (abridged):
>>>>
>>>>   +----------+       |\            +------+
>>>>   | dram_pll |-------|M| dram_core |      |
>>>>   +----------+       |U|---------->| D    |
>>>>                   /--|X|           |  D   |
>>>>     dram_alt_root |  |/            |   R  |
>>>>                   |                |    C |
>>>>              +---------+           |      |
>>>>              |FIX DIV/4|           |      |
>>>>              +---------+           |      |
>>>>    composite:     |                |      |
>>>>   +----------+    |                |      |
>>>>   | dram_alt |----/                |      |
>>>>   +----------+                     |      |
>>>>   | dram_apb |-------------------->|      |
>>>>   +----------+                     +------+
>>>>
>>>> The dram_pll is used for higher rates and dram_alt is used for lower
>>>> rates. The dram_alt and dram_apb clocks are "imx composite" and their
>>>> parent can also be modified.
>>>>
>>>> This driver will prepare/enable the new parents ahead of switching (so
>>>> that the expected roots are enabled) and afterwards it will call
>>>> clk_set_parent to ensure the parents in clock framework are up-to-date.
>>>>
>>>> The driver relies on dram_pll dram_alt and dram_apb being marked with
>>>> CLK_GET_RATE_NOCACHE for rate updates.
>>>>
>>>> Signed-off-by: Leonard Crestez <leonard.crestez@nxp.com>
>>>> ---
>>>>   drivers/devfreq/Kconfig      |   9 +
>>>>   drivers/devfreq/Makefile     |   1 +
>>>>   drivers/devfreq/imx8m-ddrc.c | 460 +++++++++++++++++++++++++++++++++++
>>>>   3 files changed, 470 insertions(+)
>>>>   create mode 100644 drivers/devfreq/imx8m-ddrc.c
>>>>
>>>> diff --git a/drivers/devfreq/Kconfig b/drivers/devfreq/Kconfig
>>>> index 066e6c4efaa2..923a6132e741 100644
>>>> --- a/drivers/devfreq/Kconfig
>>>> +++ b/drivers/devfreq/Kconfig
>>>> @@ -89,10 +89,19 @@ config ARM_EXYNOS_BUS_DEVFREQ
>>>>   	  Each memory bus group could contain many memoby bus block. It reads
>>>>   	  PPMU counters of memory controllers by using DEVFREQ-event device
>>>>   	  and adjusts the operating frequencies and voltages with OPP support.
>>>>   	  This does not yet operate with optimal voltages.
>>>>   
>>>> +config ARM_IMX8M_DDRC_DEVFREQ
>>>> +	tristate "i.MX8M DDRC DEVFREQ Driver"
>>>> +	depends on ARCH_MXC || COMPILE_TEST
>>>> +	select DEVFREQ_GOV_SIMPLE_ONDEMAND
>>>> +	select DEVFREQ_GOV_USERSPACE
>>>> +	help
>>>> +	  This adds the DEVFREQ driver for the i.MX8M DDR Controller. It allows
>>>> +	  adjusting DRAM frequency.
>>>> +
>>>>   config ARM_TEGRA_DEVFREQ
>>>>   	tristate "NVIDIA Tegra30/114/124/210 DEVFREQ Driver"
>>>>   	depends on ARCH_TEGRA_3x_SOC || ARCH_TEGRA_114_SOC || \
>>>>   		ARCH_TEGRA_132_SOC || ARCH_TEGRA_124_SOC || \
>>>>   		ARCH_TEGRA_210_SOC || \
>>>> diff --git a/drivers/devfreq/Makefile b/drivers/devfreq/Makefile
>>>> index 338ae8440db6..3eb4d5e6635c 100644
>>>> --- a/drivers/devfreq/Makefile
>>>> +++ b/drivers/devfreq/Makefile
>>>> @@ -7,10 +7,11 @@ obj-$(CONFIG_DEVFREQ_GOV_POWERSAVE)	+= governor_powersave.o
>>>>   obj-$(CONFIG_DEVFREQ_GOV_USERSPACE)	+= governor_userspace.o
>>>>   obj-$(CONFIG_DEVFREQ_GOV_PASSIVE)	+= governor_passive.o
>>>>   
>>>>   # DEVFREQ Drivers
>>>>   obj-$(CONFIG_ARM_EXYNOS_BUS_DEVFREQ)	+= exynos-bus.o
>>>> +obj-$(CONFIG_ARM_IMX8M_DDRC_DEVFREQ)	+= imx8m-ddrc.o
>>>>   obj-$(CONFIG_ARM_RK3399_DMC_DEVFREQ)	+= rk3399_dmc.o
>>>>   obj-$(CONFIG_ARM_TEGRA_DEVFREQ)		+= tegra30-devfreq.o
>>>>   obj-$(CONFIG_ARM_TEGRA20_DEVFREQ)	+= tegra20-devfreq.o
>>>>   
>>>>   # DEVFREQ Event Drivers
>>>> diff --git a/drivers/devfreq/imx8m-ddrc.c b/drivers/devfreq/imx8m-ddrc.c
>>>> new file mode 100644
>>>> index 000000000000..62abb9b79d8a
>>>> --- /dev/null
>>>> +++ b/drivers/devfreq/imx8m-ddrc.c
>>>> @@ -0,0 +1,460 @@
>>>> +// SPDX-License-Identifier: GPL-2.0
>>>> +/*
>>>> + * Copyright 2019 NXP
>>>> + */
>>>> +
>>>> +#include <linux/module.h>
>>>> +#include <linux/device.h>
>>>> +#include <linux/of_device.h>
>>>> +#include <linux/platform_device.h>
>>>> +#include <linux/devfreq.h>
>>>> +#include <linux/pm_opp.h>
>>>> +#include <linux/clk.h>
>>>> +#include <linux/clk-provider.h>
>>>> +#include <linux/arm-smccc.h>
>>>> +
>>>> +#define IMX_SIP_DDR_DVFS			0xc2000004
>>>> +
>>>> +/* Values starting from 0 switch to specific frequency */
>>>> +#define IMX_SIP_DDR_FREQ_SET_HIGH		0x00
>>>> +
>>>> +/* Deprecated after moving IRQ handling to ATF */
>>>> +#define IMX_SIP_DDR_DVFS_WAIT_CHANGE		0x0F
>>>> +
>>>> +/* Query available frequencies. */
>>>> +#define IMX_SIP_DDR_DVFS_GET_FREQ_COUNT		0x10
>>>> +#define IMX_SIP_DDR_DVFS_GET_FREQ_INFO		0x11
>>>> +
>>>> +/*
>>>> + * This should be in a 1:1 mapping with devicetree OPPs but
>>>> + * firmware provides additional info.
>>>> + */
>>>> +struct imx8m_ddrc_freq {
>>>> +	unsigned long rate;
>>>> +	unsigned long smcarg;
>>>> +	int dram_core_parent_index;
>>>> +	int dram_alt_parent_index;
>>>> +	int dram_apb_parent_index;
>>>> +};
>>>> +
>>>> +/* Hardware limitation */
>>>> +#define IMX8M_DDRC_MAX_FREQ_COUNT 4
>>>> +
>>>> +/*
>>>> + * i.MX8M DRAM Controller clocks have the following structure (abridged):
>>>> + *
>>>> + * +----------+       |\            +------+
>>>> + * | dram_pll |-------|M| dram_core |      |
>>>> + * +----------+       |U|---------->| D    |
>>>> + *                 /--|X|           |  D   |
>>>> + *   dram_alt_root |  |/            |   R  |
>>>> + *                 |                |    C |
>>>> + *            +---------+           |      |
>>>> + *            |FIX DIV/4|           |      |
>>>> + *            +---------+           |      |
>>>> + *  composite:     |                |      |
>>>> + * +----------+    |                |      |
>>>> + * | dram_alt |----/                |      |
>>>> + * +----------+                     |      |
>>>> + * | dram_apb |-------------------->|      |
>>>> + * +----------+                     +------+
>>>> + *
>>>> + * The dram_pll is used for higher rates and dram_alt is used for lower rates.
>>>> + *
>>>> + * Frequency switching is implemented in TF-A (via SMC call) and can change the
>>>> + * configuration of the clocks, including mux parents. The dram_alt and
>>>> + * dram_apb clocks are "imx composite" and their parent can change too.
>>>> + *
>>>> + * We need to prepare/enable the new mux parents head of switching and update
>>>> + * their information afterwards.
>>>> + */
>>>> +struct imx8m_ddrc {
>>>> +	struct devfreq_dev_profile profile;
>>>> +	struct devfreq *devfreq;
>>>> +
>>>> +	/* For frequency switching: */
>>>> +	struct clk *dram_core;
>>>> +	struct clk *dram_pll;
>>>> +	struct clk *dram_alt;
>>>> +	struct clk *dram_apb;
>>>> +
>>>> +	int freq_count;
>>>> +	struct imx8m_ddrc_freq freq_table[IMX8M_DDRC_MAX_FREQ_COUNT];
>>>> +};
>>>> +
>>>> +static struct imx8m_ddrc_freq *imx8m_ddrc_find_freq(struct imx8m_ddrc *priv,
>>>> +						    unsigned long rate)
>>>> +{
>>>> +	struct imx8m_ddrc_freq *freq;
>>>> +	int i;
>>>> +
>>>> +	/*
>>>> +	 * Firmware reports values in MT/s, so we round-down from Hz
>>>> +	 * Rounding is extra generous to ensure a match.
>>>> +	 */
>>>> +	rate = DIV_ROUND_CLOSEST(rate, 250000);
>>>> +	for (i = 0; i < priv->freq_count; ++i) {
>>>> +		freq = &priv->freq_table[i];
>>>> +		if (freq->rate == rate ||
>>>> +				freq->rate + 1 == rate ||
>>>> +				freq->rate - 1 == rate)
>>>> +			return freq;
>>>> +	}
>>>> +
>>>> +	return NULL;
>>>> +}
>>>> +
>>>> +static void imx8m_ddrc_smc_set_freq(int target_freq)
>>>> +{
>>>> +	struct arm_smccc_res res;
>>>> +	u32 online_cpus = 0;
>>>> +	int cpu;
>>>> +
>>>> +	local_irq_disable();
>>>> +
>>>> +	for_each_online_cpu(cpu)
>>>> +		online_cpus |= (1 << (cpu * 8));
>>>> +
>>>> +	/* change the ddr freqency */
>>>> +	arm_smccc_smc(IMX_SIP_DDR_DVFS, target_freq, online_cpus,
>>>> +			0, 0, 0, 0, 0, &res);
>>>> +
>>>> +	local_irq_enable();
>>>> +}
>>>> +
>>>> +struct clk *clk_get_parent_by_index(struct clk *clk, int index)
>>>> +{
>>>> +	struct clk_hw *hw;
>>>> +
>>>> +	hw = clk_hw_get_parent_by_index(__clk_get_hw(clk), index);
>>>> +
>>>> +	return hw ? hw->clk : NULL;
>>>> +}
>>>> +
>>>> +static int imx8m_ddrc_set_freq(struct device *dev, struct imx8m_ddrc_freq *freq)
>>>> +{
>>>> +	struct imx8m_ddrc *priv = dev_get_drvdata(dev);
>>>> +	struct clk *new_dram_core_parent;
>>>> +	struct clk *new_dram_alt_parent;
>>>> +	struct clk *new_dram_apb_parent;
>>>> +	int ret;
>>>> +
>>>> +	/*
>>>> +	 * Fetch new parents
>>>> +	 *
>>>> +	 * new_dram_alt_parent and new_dram_apb_parent are optional but
>>>> +	 * new_dram_core_parent is not.
>>>> +	 */
>>>> +	new_dram_core_parent = clk_get_parent_by_index(
>>>> +			priv->dram_core, freq->dram_core_parent_index - 1);
>>>> +	if (!new_dram_core_parent) {
>>>> +		dev_err(dev, "failed to fetch new dram_core parent\n");
>>>> +		return -EINVAL;
>>>> +	}
>>>> +	if (freq->dram_alt_parent_index) {
>>>> +		new_dram_alt_parent = clk_get_parent_by_index(
>>>> +				priv->dram_alt,
>>>> +				freq->dram_alt_parent_index - 1);
>>>> +		if (!new_dram_alt_parent) {
>>>> +			dev_err(dev, "failed to fetch new dram_alt parent\n");
>>>> +			return -EINVAL;
>>>> +		}
>>>> +	} else
>>>> +		new_dram_alt_parent = NULL;
>>>> +
>>>> +	if (freq->dram_alt_parent_index) {
>>>> +		new_dram_apb_parent = clk_get_parent_by_index(
>>>> +				priv->dram_apb, freq->dram_apb_parent_index - 1);
>>>> +		if (!new_dram_alt_parent) {
>>>> +			dev_err(dev, "failed to fetch new dram_apb parent\n");
>>>> +			return -EINVAL;
>>>> +		}
>>>> +	} else
>>>> +		new_dram_apb_parent = NULL;
>>>> +
>>>> +	/* increase reference counts and ensure clks are ON before switch */
>>>> +	ret = clk_prepare_enable(new_dram_core_parent);
>>>> +	if (ret) {
>>>> +		dev_err(dev, "failed enable new dram_core parent: %d\n", ret);
>>>
>>> s/failed enable/failed to enable
>>>
>>>> +		goto out;
>>>> +	}
>>>> +	ret = clk_prepare_enable(new_dram_alt_parent);
>>>> +	if (ret) {
>>>> +		dev_err(dev, "failed enable new dram_alt parent: %d\n", ret);
>>>
>>> s/failed enable/failed to enable
>>>
>>>> +		goto out_disable_core_parent;
>>>> +	}
>>>> +	ret = clk_prepare_enable(new_dram_apb_parent);
>>>> +	if (ret) {
>>>> +		dev_err(dev, "failed enable new dram_apb parent: %d\n", ret);
>>>
>>> s/failed enable/failed to enable
>>>
>>>> +		goto out_disable_alt_parent;
>>>> +	}
>>>> +
>>>> +	imx8m_ddrc_smc_set_freq(freq->smcarg);
>>>> +
>>>> +	/* update parents in clk tree after switch. */
>>>> +	ret = clk_set_parent(priv->dram_core, new_dram_core_parent);
>>>> +	if (ret)
>>>> +		dev_warn(dev, "failed set dram_core parent: %d\n", ret);
>>>
>>> s/failed set/failed to set
>>>
>>>> +	if (new_dram_alt_parent) {
>>>> +		ret = clk_set_parent(priv->dram_alt, new_dram_alt_parent);
>>>> +		if (ret)
>>>> +			dev_warn(dev, "failed set dram_alt parent: %d\n", ret);
>>>
>>> s/failed set/failed to set
>>>
>>>> +	}
>>>> +	if (new_dram_apb_parent) {
>>>> +		ret = clk_set_parent(priv->dram_apb, new_dram_apb_parent);
>>>> +		if (ret)
>>>> +			dev_warn(dev, "failed set dram_apb parent: %d\n", ret);
>>>
>>> s/failed set/failed to set
> 
> OK, but this might make a few messages longer than 80 chars.

I don't like over 80 chars as I already commented.

	dev_warn(dev,
		"failed set dram_apb parent: %d\n", ret);

> 
>>>> +	}
>>>> +
>>>> +	/*
>>>> +	 * Explicitly refresh dram PLL rate.
>>>> +	 *
>>>> +	 * Even if it's marked with CLK_GET_RATE_NOCACHE the rate will not be
>>>> +	 * automatically refreshed when clk_get_rate is called on children.
>>>> +	 */
>>>> +	clk_get_rate(priv->dram_pll);
>>>> +
>>>> +	/*
>>>> +	 * clk_set_parent transfer the reference count from old parent.
>>>> +	 * now we drop extra reference counts used during the switch
>>>> +	 */
>>>> +	clk_disable_unprepare(new_dram_apb_parent);
>>>> +out_disable_alt_parent:
>>>> +	clk_disable_unprepare(new_dram_alt_parent);
>>>> +out_disable_core_parent:
>>>> +	clk_disable_unprepare(new_dram_core_parent);
>>>> +out:
>>>> +	return ret;
>>>> +}
>>>> +
>>>> +static int imx8m_ddrc_target(struct device *dev, unsigned long *freq, u32 flags)
>>>> +{
>>>> +	struct imx8m_ddrc *priv = dev_get_drvdata(dev);
>>>> +	struct imx8m_ddrc_freq *freq_info;
>>>> +	struct dev_pm_opp *new_opp;
>>>> +	unsigned long old_freq, new_freq;
>>>> +	int ret;
>>>> +
>>>> +	new_opp = devfreq_recommended_opp(dev, freq, flags);
>>>> +	if (IS_ERR(new_opp)) {
>>>> +		ret = PTR_ERR(new_opp);
>>>> +		dev_err(dev, "failed to get recommended opp: %d\n", ret);
>>>> +		return ret;
>>>> +	}
>>>> +	dev_pm_opp_put(new_opp);
>>>> +
>>>> +	old_freq = clk_get_rate(priv->dram_core);
>>>> +	if (*freq == old_freq)
>>>> +		return 0;
>>>> +
>>>> +	freq_info = imx8m_ddrc_find_freq(priv, *freq);
>>>> +	if (!freq_info)
>>>> +		return -EINVAL;
>>>> +
>>>> +	/*
>>>> +	 * Read back the clk rate to verify switch was correct and so that
>>>> +	 * we can report it on all error paths.
>>>> +	 */
>>>> +	ret = imx8m_ddrc_set_freq(dev, freq_info);
>>>> +
>>>> +	new_freq = clk_get_rate(priv->dram_core);
>>>> +	if (ret)
>>>> +		dev_err(dev, "ddrc failed freq switch to %lu from %lu: error %d. now at %lu\n",
>>>> +			old_freq, *freq, ret, new_freq);
>>>> +	else if (*freq != new_freq)
>>>> +		dev_err(dev, "ddrc failed freq update to %lu from %lu, now at %lu\n",
>>>> +			old_freq, *freq, new_freq);
>>>
>>> Actually, is it error? When use clk_set_rate with target_freq,
>>> if target_freq is not same with supported clock of h/w clock,
>>> the clk_set_rate set the similiar clock rate among the supported clock table.
>>>
>>> It means that if the user of clock_set_rate() enters the unsupported clock rate,
>>> the case of (*freq != new_freq) happen.
>>>
>>> Are you sure that you want to show the error when this case (*freq != new_freq)?
>>> The your origin code is not wrong. Just question from me.
> 
> The assumption here is that the OPP table will contain the precise 
> frequency as reported by clk_get_rate after a switch.

nitpick:
As I said, I think it's not error. If failed to set the clock rate
with any value, it is error.  But, if clk_set_rate() selected
the supported clock, it is not error.

But, I'm sure that you completed the test and you could want to
keep this line. I'm OK.

> 
> For example imx8mq-evk.dts has an OPP of exactly 166935483 Hz.> 
>>>> +	else
>>>> +		dev_dbg(dev, "ddrc freq set to %lu (was %lu)\n",
>>>> +			*freq, old_freq);
>>>> +
>>>> +	return ret;
>>>> +}
>>>> +
>>>> +static int imx8m_ddrc_get_cur_freq(struct device *dev, unsigned long *freq)
>>>> +{
>>>> +	struct imx8m_ddrc *priv = dev_get_drvdata(dev);
>>>> +
>>>> +	*freq = clk_get_rate(priv->dram_core);
>>>> +
>>>> +	return 0;
>>>> +}
>>>> +
>>>> +static int imx8m_ddrc_get_dev_status(struct device *dev,
>>>> +				     struct devfreq_dev_status *stat)
>>>
>>> get_dev_status() callback is called by only simpleondemand governor.
>>> When userspace governor is used, this function is never called.
>>> So, need to drop this function and then add this function on next time.
> 
> Then you get an oops on "echo simple_ondemand > governor".
> 
> In theory the simple_ondemand governor could check for NULL 
> "get_dev_status" or devfreq core could reject switching to 
> simple_ondemand if no get_dev_status is implemented. For example a 
> devfreq_governor.validate callback could be implemented?

Don't do that. I'll re-implement the governor flag like immutable
/interrupt-driven and add the feature that the devfreq device driver
specifies the supported governors when adding the device. I'll.

> 
> But right now the "get_dev_status" callback is NOT optional.

OK. Keep the get_dev_status().

> 
>>>> +{
>>>> +	struct imx8m_ddrc *priv = dev_get_drvdata(dev);
>>>> +
>>>> +	stat->busy_time = 0;
>>>> +	stat->total_time = 0;
>>>> +	stat->current_frequency = clk_get_rate(priv->dram_core);
>>>> +
>>>> +	return 0;
>>>> +}
>>>> +
>>>> +static int imx8m_ddrc_init_freq_info(struct device *dev)
>>>> +{
>>>> +	struct imx8m_ddrc *priv = dev_get_drvdata(dev);
>>>> +	struct arm_smccc_res res;
>>>> +	int index;
>>>> +
>>>> +	/* An error here means DDR DVFS API not supported by firmware */
>>>> +	arm_smccc_smc(IMX_SIP_DDR_DVFS, IMX_SIP_DDR_DVFS_GET_FREQ_COUNT,
>>>> +			0, 0, 0, 0, 0, 0, &res);
>>>> +	priv->freq_count = res.a0;
>>>> +	if (priv->freq_count <= 0 ||
>>>> +			priv->freq_count > IMX8M_DDRC_MAX_FREQ_COUNT)
>>>> +		return -ENODEV;
>>>> +
>>>> +	for (index = 0; index < priv->freq_count; ++index) {
>>>> +		struct imx8m_ddrc_freq *freq = &priv->freq_table[index];
>>>> +
>>>> +		arm_smccc_smc(IMX_SIP_DDR_DVFS, IMX_SIP_DDR_DVFS_GET_FREQ_INFO,
>>>> +			      index, 0, 0, 0, 0, 0, &res);
>>>> +		/* Result should be strictly positive */
>>>> +		if ((long)res.a0 <= 0)
>>>> +			return -ENODEV;
>>>> +
>>>> +		freq->rate = res.a0;
>>>> +		freq->smcarg = index;
>>>> +		freq->dram_core_parent_index = res.a1;
>>>> +		freq->dram_alt_parent_index = res.a2;
>>>> +		freq->dram_apb_parent_index = res.a3;
>>>> +
>>>> +		/* dram_core has 2 options: dram_pll or dram_alt_root */
>>>> +		if (freq->dram_core_parent_index != 1 &&
>>>> +				freq->dram_core_parent_index != 2)
>>>> +			return -ENODEV;
>>>> +		/* dram_apb and dram_alt have exactly 8 possible parents */
>>>> +		if (freq->dram_alt_parent_index > 8 ||
>>>> +				freq->dram_apb_parent_index > 8)
>>>> +			return -ENODEV;
>>>> +		/* dram_core from alt requires explicit dram_alt parent */
>>>> +		if (freq->dram_core_parent_index == 2 &&
>>>> +				freq->dram_alt_parent_index == 0)
>>>> +			return -ENODEV;
>>>> +	}
>>>> +
>>>> +	return 0;
>>>> +}
>>>> +
>>>> +static int imx8m_ddrc_check_opps(struct device *dev)
>>>> +{
>>>> +	struct imx8m_ddrc *priv = dev_get_drvdata(dev);
>>>> +	struct imx8m_ddrc_freq *freq_info;
>>>> +	struct dev_pm_opp *opp;
>>>> +	unsigned long freq;
>>>> +
>>>> +	/* Enumerate DT OPPs and disable those not supported by firmware */
>>>> +	freq = ULONG_MAX;
>>>> +	while (true) {
>>
>> You can get the number of OPP entries int the opp table
>> with dev_pm_opp_get_count(dev). I think that better to
>> use the correct number of OPP entries instead of 'while(true)' style.
> 
> I need to enumerate frequencies and there's no "get_freq_by_index" in 
> opp core that I can find so I'd still need to use 
> dev_pm_opp_find_freq_floor.

Yes. I agree. Just I recommend that use the dev_pm_opp_get_opp_count()
instead of infinite loop style with 'while(true)'. I don't prefer to
use the infinite loop coding-sytle.

> 
> It's strange that OPP core doesn't offer additional support for 
> enumerating OPPs like a for_each macro?

Right there are no for_each_macro. 

imx8m_ddrc_check_opps() is similiar with 'set_freq_table()'
in devfreq.c with dev_pm_opp_get_opp_count(). You can refer to it.

> 
>>>> +		opp = dev_pm_opp_find_freq_floor(dev, &freq);
>>>> +		if (opp == ERR_PTR(-ERANGE))
>>>> +			break;
>>>> +		if (IS_ERR(opp)) {
>>>> +			dev_err(dev, "Failed enumerating OPPs: %ld\n",
>>>> +				PTR_ERR(opp));
>>>> +			return PTR_ERR(opp);
>>>> +		}
>>>> +		dev_pm_opp_put(opp);
>>>> +
>>>> +		freq_info = imx8m_ddrc_find_freq(priv, freq);
>>>> +		if (!freq_info) {
>>>> +			dev_info(dev, "Disable unsupported OPP %luHz %luMT/s\n",
>>>> +					freq, DIV_ROUND_CLOSEST(freq, 250000));
>>>> +			dev_pm_opp_disable(dev, freq);
>>>> +		}
>>>> +
>>>> +		freq--;
>>>> +	}
>>>> +
>>>> +	return 0;
>>>> +}
>>>> +
>>>> +static void imx8m_ddrc_exit(struct device *dev)
>>>> +{
>>>> +	dev_pm_opp_of_remove_table(dev);
>>>> +}
>>>> +
>>>> +static int imx8m_ddrc_probe(struct platform_device *pdev)
>>>> +{
>>>> +	struct device *dev = &pdev->dev;
>>>> +	struct imx8m_ddrc *priv;
>>>> +	const char *gov = DEVFREQ_GOV_USERSPACE;
>>>> +	int ret;
>>>> +
>>>> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
>>>> +	if (!priv)
>>>> +		return -ENOMEM;
>>>> +
>>>> +	platform_set_drvdata(pdev, priv);
>>>> +
>>>> +	ret = imx8m_ddrc_init_freq_info(dev);
>>>> +	if (ret) {
>>>> +		dev_err(dev, "failed to init firmware freq info: %d\n", ret);
>>>> +		return ret;
>>>> +	}
>>>> +
>>>> +	priv->dram_core = devm_clk_get(dev, "core");
>>>> +	priv->dram_pll = devm_clk_get(dev, "pll");
>>>> +	priv->dram_alt = devm_clk_get(dev, "alt");
>>>> +	priv->dram_apb = devm_clk_get(dev, "apb");
>>>> +	if (IS_ERR(priv->dram_core) ||
>>>> +		IS_ERR(priv->dram_pll) ||
>>>> +		IS_ERR(priv->dram_alt) ||
>>>> +		IS_ERR(priv->dram_apb)) {
>>>> +		ret = PTR_ERR(priv->devfreq);
>>>> +		dev_err(dev, "failed to fetch clocks: %d\n", ret);
>>>> +		return ret;
>>>> +	}
>>>> +
>>>> +	ret = dev_pm_opp_of_add_table(dev);
>>>> +	if (ret < 0) {
>>>> +		dev_err(dev, "failed to get OPP table\n");
>>>> +		return ret;
>>>> +	}
>>>> +
>>>> +	ret = imx8m_ddrc_check_opps(dev);
>>>> +	if (ret < 0)
>>>> +		goto err;
>>>> +
>>>> +	priv->profile.polling_ms = 1000;
>>>> +	priv->profile.target = imx8m_ddrc_target;
>>>> +	priv->profile.get_dev_status = imx8m_ddrc_get_dev_status;
>>>
>>> ditto. It is not used on this patch. On later, add the get_dev_status
>>> for the ondemand governor.
>>>
>>>> +	priv->profile.exit = imx8m_ddrc_exit;
>>>> +	priv->profile.get_cur_freq = imx8m_ddrc_get_cur_freq;
>>>> +	priv->profile.initial_freq = clk_get_rate(priv->dram_core);
>>>> +
>>>> +	priv->devfreq = devm_devfreq_add_device(dev, &priv->profile,
>>>> +						gov, NULL);
>>>> +	if (IS_ERR(priv->devfreq)) {
>>>> +		ret = PTR_ERR(priv->devfreq);
>>>> +		dev_err(dev, "failed to add devfreq device: %d\n", ret);
>>>> +		goto err;
>>>> +	}
>>>> +
>>>> +	return 0;
>>>> +
>>>> +err:
>>>> +	dev_pm_opp_of_remove_table(dev);
>>>> +	return ret;
>>>> +}
>>>> +
>>>> +static const struct of_device_id imx8m_ddrc_of_match[] = {
>>>> +	{ .compatible = "fsl,imx8m-ddrc", },
>>>> +	{ /* sentinel */ },
>>>> +};
>>>> +MODULE_DEVICE_TABLE(of, imx8m_ddrc_of_match);
>>>> +
>>>> +static struct platform_driver imx8m_ddrc_platdrv = {
>>>> +	.probe		= imx8m_ddrc_probe,
>>>> +	.driver = {
>>>> +		.name	= "imx8m-ddrc-devfreq",
>>>> +		.of_match_table = of_match_ptr(imx8m_ddrc_of_match),
>>>> +	},
>>>> +};
>>>> +module_platform_driver(imx8m_ddrc_platdrv);
>>>> +
>>>> +MODULE_DESCRIPTION("i.MX8M DDR Controller frequency driver");
>>>> +MODULE_AUTHOR("Leonard Crestez <leonard.crestez@nxp.com>");
>>>> +MODULE_LICENSE("GPL v2");
> 
> 


-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
