Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 749746B2471
	for <lists+linux-clk@lfdr.de>; Thu,  9 Mar 2023 13:44:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229873AbjCIMoL (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 9 Mar 2023 07:44:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229770AbjCIMoK (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 9 Mar 2023 07:44:10 -0500
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 102035DCAF;
        Thu,  9 Mar 2023 04:44:07 -0800 (PST)
Received: from loongson.cn (unknown [10.20.42.35])
        by gateway (Coremail) with SMTP id _____8BxfdqV1AlkQmsKAA--.2354S3;
        Thu, 09 Mar 2023 20:44:05 +0800 (CST)
Received: from [10.20.42.35] (unknown [10.20.42.35])
        by localhost.localdomain (Coremail) with SMTP id AQAAf8Ax+72S1Alk5J1QAA--.8149S3;
        Thu, 09 Mar 2023 20:44:04 +0800 (CST)
Subject: Re: [PATCH v13 1/2] dt-bindings: clock: add loongson-2 boot clock
 index
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     Jianmin Lv <lvjianmin@loongson.cn>,
        Liu Peibao <liupeibao@loongson.cn>, wanghongliang@loongson.cn,
        loongson-kernel@lists.loongnix.cn, zhuyinbo@loongson.cn
References: <20230307115022.12846-1-zhuyinbo@loongson.cn>
 <692a62da-a9a1-fa23-6e24-723d73c3a423@linaro.org>
 <5e9b3bd5-d885-6237-5e14-2becb3c956cc@loongson.cn>
 <31e2a67a-c046-9501-80de-e754ed450195@linaro.org>
 <ace5159b-ebbd-7805-518c-ed3d39e4793e@loongson.cn>
 <b2f9cd15-b303-882a-d4e0-36d1f6d155a8@linaro.org>
 <eca81d44-2513-8002-980d-755af32f36c4@loongson.cn>
 <882bd054-9c3e-1b26-72a5-89ad92e21a79@linaro.org>
From:   zhuyinbo <zhuyinbo@loongson.cn>
Message-ID: <817a65e9-b605-4bc0-2ff5-fc7f5db8585c@loongson.cn>
Date:   Thu, 9 Mar 2023 20:44:01 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <882bd054-9c3e-1b26-72a5-89ad92e21a79@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: AQAAf8Ax+72S1Alk5J1QAA--.8149S3
X-CM-SenderInfo: 52kx5xhqerqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBjvJXoWxCFWDCw18try3Xw4xZw15CFg_yoWrKFWkpr
        18JF1UJryUJr4xJr1jqr1UGryjkr1UJw1UJr1UGF1UJr1UJr10qr47Xr1FgryUJr48J3W7
        Ar1DAr1UZF1UXwUanT9S1TB71UUUUUJqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
        qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
        bTAFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AKwVWUXVWUAwA2ocxC64
        kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28E
        F7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM2
        8EF7xvwVC2z280aVCY1x0267AKxVWxJr0_GcWln4kS14v26r1Y6r17M2AIxVAIcxkEcVAq
        07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7
        xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Y
        z7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07AlzVAYIcxG8wCF04k20xvY0x0EwI
        xGrwCF04k20xvE74AGY7Cv6cx26rWl4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAF
        wI0_Jrv_JF1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zV
        AF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4l
        IxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCw
        CI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnI
        WIevJa73UjIFyTuYvjxUcOJ5UUUUU
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


在 2023/3/9 下午2:25, Krzysztof Kozlowski 写道:
> On 09/03/2023 02:43, zhuyinbo wrote:
>> 在 2023/3/8 下午6:38, Krzysztof Kozlowski 写道:
>>> On 08/03/2023 10:24, zhuyinbo wrote:
>>>>>>> That's an ABI break and commit msg does not explain it.
>>>>>> you meaning is that need add a explanation in commit msg that why
>>>>> You need good explanation to break the ABI. I don't understand the
>>>>> commit msg, but anyway I could not find there justification for ABI
>>>>> break. If you do not have good justification, don't break the ABI,
>>>> The commit msg is the patch commit  log,  and I maybe not got it about
>>>> break the ABI.  You said about "break the ABI"
>>>>
>>>> is whether is location issue about "LOONGSON2_BOOT_CLK"?   if yes,   the
>>>> LOONGSON2_BOOT_CLK was placed
>>>>
>>>> after LOONGSON2_PIX1_PLL that is due to their clock parent is same.
>>>> and I whether need add this explanation
>>>>
>>>> in patch commit log description?
>>> Unfortunately I do not understand single thing from this.
>>>
>>> Best regards,
>>> Krzysztof
>> The patch commit log description is patch desription.  as follows:
>>
>>
>> commit 592bc2b4106d787ea166ba16bfde6b3101ab1a8a
>> Author: Yinbo Zhu <zhuyinbo@loongson.cn>
>> Date:   Tue Mar 7 17:18:32 2023 +0800
>>
>>       dt-bindings: clock: add loongson-2 boot clock index
>>
>>       The Loongson-2 boot clock was used to spi and lio peripheral and
>>       this patch was to add boot clock index number.
> I cannot understand this either.
I will rework commit msg .
>
>>
>> and your advice is "That's an ABI break and commit msg does not explain it."
>>
>> I got it  from your advice that was to add a explanation about
>> LOONGSON2_BOOT_CLK's
>>
>> location issue in patch description, right?
> ABI break needs justification, why do you think it is fine or who
> is/isn't affected etc. Your commit msg does not explain why ABI break is
> okay. It doesn't even explain to me why you need it.
  #define LOONGSON2_DC_PLL                               3
  #define LOONGSON2_PIX0_PLL                             4
  #define LOONGSON2_PIX1_PLL                             5
-#define LOONGSON2_NODE_CLK                             6
-#define LOONGSON2_HDA_CLK                              7
-#define LOONGSON2_GPU_CLK                              8
-#define LOONGSON2_DDR_CLK                              9
-#define LOONGSON2_GMAC_CLK                             10
-#define LOONGSON2_DC_CLK                               11
-#define LOONGSON2_APB_CLK                              12
-#define LOONGSON2_USB_CLK                              13
-#define LOONGSON2_SATA_CLK                             14
-#define LOONGSON2_PIX0_CLK                             15
-#define LOONGSON2_PIX1_CLK                             16
-#define LOONGSON2_CLK_END                              17
+#define LOONGSON2_BOOT_CLK                             6
+#define LOONGSON2_NODE_CLK                             7

after add my patch, if dts still use above macro and not cause any 
issue. but

if dts not use macro rather than use original clk number index that will 
cause a uncorrect clk,

eg.

-#define LOONGSON2_NODE_CLK                             6

+#define LOONGSON2_NODE_CLK                             7

  this issue is that what you said about  "ABI break",  isn't it ?


About your advice and question and I will use following description as 
patch  commit msg,  what do you think?


dt-bindings: clock: add loongson-2 boot clock index

The spi need to use boot clock and this patch is to add a boot clock 
index about  LOONGSON2_BOOT_CLK

and the LOONGSON2_BOOT_CLK was placed in after LOONGSON2_PIX1_PLL that 
due to

LOONGSON2_PIX1_PLL,  LOONGSON2_PIX0_PLL , LOONGSON2_DC_PLL and 
LOONGSON2_BOOT_CLK

has same parent clock.  In addition, the Loongson  code of the community 
is still in the development stage,

so this patch modification will  not cause uncorrect clk quote issue at 
present.

>
>
> Best regards,
> Krzysztof

