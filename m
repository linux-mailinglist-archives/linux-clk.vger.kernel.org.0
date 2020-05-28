Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E72B11E69BF
	for <lists+linux-clk@lfdr.de>; Thu, 28 May 2020 20:50:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405970AbgE1Sub (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 28 May 2020 14:50:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405944AbgE1Sua (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 28 May 2020 14:50:30 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF640C08C5C7
        for <linux-clk@vger.kernel.org>; Thu, 28 May 2020 11:50:28 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id j10so204846wrw.8
        for <linux-clk@vger.kernel.org>; Thu, 28 May 2020 11:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=references:user-agent:from:to:cc:subject:in-reply-to:date
         :message-id:mime-version;
        bh=pODECW6glMg3JushrPY0HrrP8g/Q7UXeTQjmwOr5TbU=;
        b=chNTz8wU2wOhm8jMyCHof+VVeKfe17owrJyuufRm/vdRBh0WOqg79OSbtL9dDEu52L
         0vlLllNl6kEv38SGnvGVUZzgNI8JKzuYSnsgoNSG+OyyStP9puCCAK+XfUDnsYsnbret
         Ts0Hka8IltX0FxJtFgoZgujQStku+YjQPtymPMklBOjg3uogwabcVUJq2YgPvu2405Xv
         pF3UDn5fHrUPkm6N0iDwuNZRlXZQrx9TL4yvkgmMV13CcRngYeaQZRdZKnoFYPQLvz0E
         f6I9CA+b+MmvDhybHUcZ5gH9di1DUJhOk2SOwEFMGu9d9yt3P5DD9I6qdN/j2yPqQVVV
         kXWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject
         :in-reply-to:date:message-id:mime-version;
        bh=pODECW6glMg3JushrPY0HrrP8g/Q7UXeTQjmwOr5TbU=;
        b=pu7yz104oPDvfYeYPa5vKcb+VdGs2DuV0dG/di0dAluwVsUFdHYOToteEWPonmdNIZ
         tuUAVs77kQqX9ak1bIs6/VXbm7iw7sri3dC3MRL3iy+swOKAhFzlQWKqo2WZ1odBecSB
         aYsT/lJqK4XOsqQcrMuEbipKR3jD0GEvpkvJ/ElPySBnn/PamXL+tJCDgAZac1IVbm6F
         bRF+cJN+N22BTVBwJDsQ6z9D0QCkwZnJzmiyxr/PbVVCZ1/v4tYZxQnkNcekZJgsMdtM
         TMUQPc2PbmUf+CL/PCWf0IVXiVv1jhv+zmVsZlvtebaifB2j7EF8ValWBRdjrOWdA09S
         CrIA==
X-Gm-Message-State: AOAM5303CmWe7CLnoRqxtYiKuHABg+pa3/oofp5hhagD1ywlvUy76fJ0
        ahyGY8IG78BRaL2ShvUYNazOrA==
X-Google-Smtp-Source: ABdhPJw4Hv6GO3pvJyjd8vmZoOfsX8v/nCGFrjk8SwOA22ipOJcKxblHbhKuBvNLLCEHgFSnHuehsQ==
X-Received: by 2002:adf:f8c8:: with SMTP id f8mr4744111wrq.151.1590691826650;
        Thu, 28 May 2020 11:50:26 -0700 (PDT)
Received: from localhost (cag06-3-82-243-161-21.fbx.proxad.net. [82.243.161.21])
        by smtp.gmail.com with ESMTPSA id d15sm6939518wrq.30.2020.05.28.11.50.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2020 11:50:26 -0700 (PDT)
References: <20200519170440.294601-1-jbrunet@baylibre.com> <159057105860.88029.17177553048016076314@swboyd.mtv.corp.google.com>
User-agent: mu4e 1.3.3; emacs 26.3
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Stephen Boyd <sboyd@kernel.org>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc:     linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: add api to get clk consummer from clk_hw
In-reply-to: <159057105860.88029.17177553048016076314@swboyd.mtv.corp.google.com>
Date:   Thu, 28 May 2020 20:50:25 +0200
Message-ID: <1ja71rki6m.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


On Wed 27 May 2020 at 11:17, Stephen Boyd <sboyd@kernel.org> wrote:

> Quoting Jerome Brunet (2020-05-19 10:04:40)
>> clk_register() is deprecated. Using 'clk' member of struct clk_hw is
>> discouraged. With this constrainst, it is difficult for driver to
>
> s/constrainst/constraint/
>
>> register clocks using the clk_hw API and then use the clock with
>> the consummer API
>
> s/consummer/consumer/
>
>> 
>> This add a simple helper, clk_hw_get_clk(), to get a struct clk from
>> a struct clk_hw. Like other clk_get() variant, each call to this helper
>> must be balanced with a call to clk_put().
>> 
>> Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
>> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>
> I like it!
>
>> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
>> index 6fd23ce3cb03..d9946e192cbc 100644
>> --- a/drivers/clk/clk.c
>> +++ b/drivers/clk/clk.c
>> @@ -3625,6 +3625,23 @@ struct clk *clk_hw_create_clk(struct device *dev, struct clk_hw *hw,
>>         return clk;
>>  }
>>  
>> +/**
>> + * clk_hw_get_clk: get clk consummer given an clk_hw
>
> s/consummer/consumer/
>
>> + * @hw: clk_hw associated with the clk being consumed
>> + *
>> + * Returns: new clk consummer
>> + * This is the function to be used by providers which need
>> + * to get a consummer clk and act on the clock element
>
> s/consummer/consumer/
>
>> + * Calls to this function must be balanced with calls clk_put()
>
> calls to clk_put()
>
>> + */
>> +struct clk *clk_hw_get_clk(struct clk_hw *hw)

Sorry about all the typos ...

>
> Can it also take a const char *id argument? That will let us "name" the
> clk structure for situations where we want to keep track of who is using
> the clk pointer for things. If that doesn't seem useful then I suppose
> we can pass a string like "clk_hw_get_clk" for con_id below and hope it
> doesn't become useful later.

Sure I can add the argument. no worries

>
>> +{
>> +       struct device *dev = hw->core->dev;
>> +
>> +       return clk_hw_create_clk(dev, hw, dev_name(dev), NULL);
>> +}
>> +EXPORT_SYMBOL(clk_hw_get_clk);
>> +
>>  static int clk_cpy_name(const char **dst_p, const char *src, bool must_exist)
>>  {
>>         const char *dst;

