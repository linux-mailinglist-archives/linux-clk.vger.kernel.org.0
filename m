Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C80A22A4CE
	for <lists+linux-clk@lfdr.de>; Thu, 23 Jul 2020 03:44:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733147AbgGWBmf (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 22 Jul 2020 21:42:35 -0400
Received: from regular1.263xmail.com ([211.150.70.198]:35384 "EHLO
        regular1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729198AbgGWBme (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 22 Jul 2020 21:42:34 -0400
Received: from localhost (unknown [192.168.167.70])
        by regular1.263xmail.com (Postfix) with ESMTP id 339BE635;
        Thu, 23 Jul 2020 09:42:26 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-ANTISPAM-LEVEL: 2
X-SKE-CHECKED: 1
X-ABS-CHECKED: 1
Received: from [172.16.12.236] (unknown [58.22.7.114])
        by smtp.263.net (postfix) whith ESMTP id P22087T140330575841024S1595468544587490_;
        Thu, 23 Jul 2020 09:42:25 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <29b66cfdfecd2f7eee694f93ea2330f7>
X-RL-SENDER: zhangqing@rock-chips.com
X-SENDER: zhangqing@rock-chips.com
X-LOGIN-NAME: zhangqing@rock-chips.com
X-FST-TO: kever.yang@rock-chips.com
X-SENDER-IP: 58.22.7.114
X-ATTACHMENT-NUM: 0
X-DNS-TYPE: 0
X-System-Flag: 0
Subject: Re: [PATCH v1] clk: Export __clk_lookup()
To:     Stephen Boyd <sboyd@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc:     mturquette@baylibre.com, linux-clk@vger.kernel.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        xxx@rock-chips.com, xf@rock-chips.com, huangtao@rock-chips.com,
        kever.yang@rock-chips.com
References: <20200722023230.10826-1-zhangqing@rock-chips.com>
 <14639646.VOZsFJ8Tpa@phil>
 <159546549321.3847286.4678382117195983280@swboyd.mtv.corp.google.com>
From:   "elaine.zhang" <zhangqing@rock-chips.com>
Organization: rockchip
Message-ID: <f3e7b8f3-e4d4-9965-703d-aa4b96f50f6d@rock-chips.com>
Date:   Thu, 23 Jul 2020 09:42:24 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <159546549321.3847286.4678382117195983280@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


在 2020/7/23 上午8:51, Stephen Boyd 写道:
> Quoting Heiko Stuebner (2020-07-22 11:26:50)
>> Hi Elaine,
>>
>> Am Mittwoch, 22. Juli 2020, 04:32:30 CEST schrieb Elaine Zhang:
>>> Export __clk_lookup() to support user built as module.
>>>
>>> ERROR:
>>> drivers/clk/rockchip/clk.ko: In function
>>> `rockchip_clk_protect_critical':
>>> drivers/clk/rockchip/clk.c:741:
>>> undefined reference to `__clk_lookup'
>> can you elaborate a bit more on why this would be needed?
>>
>> Because right now the Rockchip clocks are of course built into
>> the main kernel image (especially due to them being needed during early
>> boot) and __clk_lookup actually is a pretty deep part of the clock-
>> framework itself, as probably also denoted by the "__" in the function
>> name.
>>
> Can you stop using __clk_lookup()? The plan is to remove it.

Rk use  __clk_lookup() as:

drivers/clk/rockchip/clk.c

void __init rockchip_clk_protect_critical(const char *const clocks[],
                                           int nclocks)
{
         int i;

         /* Protect the clocks that needs to stay on */
         for (i = 0; i < nclocks; i++) {
                 struct clk *clk = __clk_lookup(clocks[i]);

                 if (clk)
                         clk_prepare_enable(clk);
         }
}
e.g:

drivers/clk/rockchip/clk-rk3328.c

static const char *const rk3328_critical_clocks[] __initconst = {
         "aclk_bus",
         "aclk_bus_niu",
         "pclk_bus",
         "pclk_bus_niu",
         "hclk_bus",
         "hclk_bus_niu",
         "aclk_peri",
............

};

If have plan to remove the __clk_lookup, I need to replace the 
rockchip_clk_protect_critical, and use the flag CLK_IS_CRITICAL.(but use 
flag CLK_IS_CRITICAL, the enable count is always "0")

>
>


