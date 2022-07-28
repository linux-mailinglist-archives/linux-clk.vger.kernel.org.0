Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2EBB2583BAD
	for <lists+linux-clk@lfdr.de>; Thu, 28 Jul 2022 12:04:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235244AbiG1KDs (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 28 Jul 2022 06:03:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234971AbiG1KDq (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 28 Jul 2022 06:03:46 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADBCD6172E
        for <linux-clk@vger.kernel.org>; Thu, 28 Jul 2022 03:03:43 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id z16so1457895wrh.12
        for <linux-clk@vger.kernel.org>; Thu, 28 Jul 2022 03:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=references:user-agent:from:to:subject:date:in-reply-to:message-id
         :mime-version;
        bh=y4T0HC+LgWXmkogwugZt7HLiFgtmRV8VQfPIoPRbde0=;
        b=csdItTfYI8AMJ6g7jI8x9ssnGKX+BNs9aZD4R1pd2bQRdogBMITspj/oV2UzNUupdo
         MBwl06n5qBT34W0MDXH3vcscdrnedwcSZdAk35NNTINrlJgG5JhkMzXc0tO4+O8fNh1A
         FjBmJHspacXIgWkhDNxtqGEdmf8LK4zRFY0uvJJ0pVlPRwbfMFlsRKGZ7FKRhG/HykKi
         OWVgf63m6zJ0Xom3esoEzx10YevVuBsL2h0ZbqwtVJD4AZVgxCggyhq991xFotWZUijv
         n3D5glVbGwxbTrgZax66+8MSsTjxdNiYgBGgcEeDUwQhP6gD91X6kybOqly3tEP+9/Hy
         CMEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:references:user-agent:from:to:subject:date
         :in-reply-to:message-id:mime-version;
        bh=y4T0HC+LgWXmkogwugZt7HLiFgtmRV8VQfPIoPRbde0=;
        b=PuRdhj1ZjpeSZhI6ywi1qlQLsza0au1+BoPMPzRSM0CLEE+KzP16zopnJ2ytEpSR0/
         KhzV7p8H0YIX0jwUAOvnHNYajJ0w3a0foPSvVAq3OBg0Yo9Bd5oCI/R7Ot0ZLXMQVBL0
         uqO64LY3f8sIPaFi3cvhLJHvAgnuo/xPmjwZgXkH9gdTc6zwndl2wQg1P4fAEFOXGBrB
         D7aXLNrNfibvJOGslz79tHVlqTVBLBPs8QOgT5oUCYUYF1su2uFjoK1Mm+8fh9Se+vph
         0QrYo40NMtx8fj1AvCBvc/a+AOo3L3yKTL5z+SIpV81inpfnFCPcc4LcNhYeG8fQWgUp
         JFvA==
X-Gm-Message-State: AJIora8dPIsJJpt6/8vNUdEWdcvg9els3KfyznK23VqoLYFIkTAnFw2B
        ASOHsTvqsOe4+IgY2DzTfrJrhg==
X-Google-Smtp-Source: AGRyM1sVUOYVm8VpDrMDKjr0I9JufvhLIMmqV/AteNtB09x3qu5lBkrmNvYEnEoreb0NoNtADZen7w==
X-Received: by 2002:a5d:6dc6:0:b0:21e:a87c:91bc with SMTP id d6-20020a5d6dc6000000b0021ea87c91bcmr7694254wrz.165.1659002622171;
        Thu, 28 Jul 2022 03:03:42 -0700 (PDT)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id m20-20020a056000181400b0021e571a99d5sm526097wrh.17.2022.07.28.03.03.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Jul 2022 03:03:41 -0700 (PDT)
References: <20220728054202.6981-1-yu.tu@amlogic.com>
 <20220728054202.6981-2-yu.tu@amlogic.com>
 <82e3fd36-df96-a555-4cea-47fabd26502b@linaro.org>
 <1jv8rhfw8h.fsf@starbuckisacylon.baylibre.com>
 <367cf98b-ef06-8f44-76c8-9099a1ec13dc@linaro.org>
 <1jmtctfuli.fsf@starbuckisacylon.baylibre.com>
 <c088e01c-0714-82be-8347-6140daf56640@linaro.org>
User-agent: mu4e 1.8.6; emacs 27.1
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Yu Tu <yu.tu@amlogic.com>, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH V2 1/3] dt-bindings: clk: meson: add S4 SoC clock
 controller bindings
Date:   Thu, 28 Jul 2022 11:54:49 +0200
In-reply-to: <c088e01c-0714-82be-8347-6140daf56640@linaro.org>
Message-ID: <1jfsilftab.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


On Thu 28 Jul 2022 at 11:48, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:

> On 28/07/2022 11:09, Jerome Brunet wrote:
>> 
>> On Thu 28 Jul 2022 at 11:02, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:
>> 
>>> On 28/07/2022 10:50, Jerome Brunet wrote:
>>>>
>>>> On Thu 28 Jul 2022 at 10:41, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:
>>>>
>>>>> On 28/07/2022 07:42, Yu Tu wrote:
>> [...]
>>>>>> +/*
>>>>>> + * CLKID index values
>>>>>> + */
>>>>>> +
>>>>>> +#define CLKID_FIXED_PLL			1
>>>>>> +#define CLKID_FCLK_DIV2			3
>>>>>> +#define CLKID_FCLK_DIV3			5
>>>>>> +#define CLKID_FCLK_DIV4			7
>>>>>> +#define CLKID_FCLK_DIV5			9
>>>>>> +#define CLKID_FCLK_DIV7			11
>>>>>
>>>>> Why these aren't continuous? IDs are expected to be incremented by 1.
>>>>>
>>>>
>>>> All clocks have IDs, it is one big table in the driver, but we are not exposing them all.
>>>> For example, with composite 'mux / div / gate' assembly, we usually need
>>>> only the leaf.
>>>
>>> I understand you do not expose them all, but that is not the reason to
>>> increment ID by 2 or 3... Otherwise these are not IDs and you are not
>>> expected to put register offsets into the bindings (you do not bindings
>>> in such case).
>> 
>> Why is it not an IDs if it not continuous in the bindings ?
>> 
>> If there is technical reason, we'll probably end up exposing everything. It
>> would not be a dramatic change. I asked for this over v1 because we have
>> done that is the past and I think it makes sense.
>> 
>> I'm happy to be convinced to do things differently. Just looking for the
>> technical reason that require contiuous exposed IDs.
>> 
>> The other IDs exists, but we do not expose them as bindings.
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/clk/meson/gxbb.h#n125
>
> https://lore.kernel.org/linux-devicetree/CAK8P3a1APzs74YTcZ=m43G3zrmwJZKcYSTvV5eDDQX-37UY7Tw@mail.gmail.com/
>
> https://lore.kernel.org/linux-devicetree/CAK8P3a0fDJQvGLEtG0fxLkG08Fh9V7LEMPsx4AaS+2Ldo_xWxw@mail.gmail.com/
>
> https://lore.kernel.org/linux-devicetree/b60f5fd2-dc48-9375-da1c-ffcfe8292683@linaro.org/
>
> The IDs are abstract numbers, where the number does not matter because
> it is not tied to driver implementation or device programming model. The
> driver maps ID to respective clock.
>
> Using some meaningful numbers as these IDs, means you tied bindings to
> your implementation and any change in implementation requires change in
> the bindings. This contradicts the idea of bindings.
>

I totally agree. Bindings ID are abstract numbers.
We do follow that. We even document it:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/clk/meson/gxbb.h#n118

It is just a choice to not expose some IDs.
It is not tied to the implementation at all.
I think we actually follow the rules and the idea behind it.

We can expose then all If you still think what we are doing is not appropriate.

I'd like things to be consistent though. So if the decision is to
expose everything, I'll probably end up doing the same for the old SoCs.
