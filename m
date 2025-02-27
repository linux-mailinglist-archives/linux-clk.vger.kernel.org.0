Return-Path: <linux-clk+bounces-18700-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A92FFA479C8
	for <lists+linux-clk@lfdr.de>; Thu, 27 Feb 2025 11:07:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9C114172305
	for <lists+linux-clk@lfdr.de>; Thu, 27 Feb 2025 10:07:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BACB228CB0;
	Thu, 27 Feb 2025 10:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="0f1uKBdr"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 919FB1E833A
	for <linux-clk@vger.kernel.org>; Thu, 27 Feb 2025 10:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740650866; cv=none; b=FoFRG8sYAKsf9KPsSTgVchDsXctq+fvrm4/0OLK07j7BoFp+zuhzJf5o1kgk+DAp1rC5oHaOg+nF6y6WvCkzQ853u0GCCDIyXkzxXZQmhwqfYGIx2J8PwDFK6Iwbo/gwIPi8Azex/WaBN1vKRTJLTSW+swR027x3bPSV7Ol5c9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740650866; c=relaxed/simple;
	bh=tCRr47dsQ49YhbUh68h+oT+DYH3hDIjoXkf9VOzHTwM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=WIn5qigLZzpnqClGyFJVAnWiYSUbNbIsFdVlAvu4hgvFp6e1Hl5lLarpb0PYzznF2MHjnoqEE1PQbyKFrlqBN5Fsvt8YGaNdylwSurtV2vUe/166/xrlS1IE401KX3UlDCs6yVbBJ3UzOeEvfWIF/7gOlbvSk8GpUraBOlWNqVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=0f1uKBdr; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4398ec2abc2so6778445e9.1
        for <linux-clk@vger.kernel.org>; Thu, 27 Feb 2025 02:07:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1740650861; x=1741255661; darn=vger.kernel.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lHQRWQJHJt80gVTv/WssWxcrsPw0Wlw1SM3KJrgvUyg=;
        b=0f1uKBdrXmhdJRySl8BVNoH2SiB97LnZseVrWER7oTVyYQs8aCALvK75TATGJ6Y3NF
         rZpbo3UwFdld6YzCNJusavOkFNGDwe4IYQaHPpOUbk/LJGHpfBQp1V4UVbs/PAbXzlFO
         D0pIaYsE+WJwSwygrddl3JhbvdE7Fw21cxHS0LWjPFZvoIAeDlrMceiX+VwGR+9S5fo/
         sK3q2oHeTIjNhX2yfzD08F3ziQQI31x8nRjQL+dHJiwh16W18Er2DYc/ROGoicO6qZKu
         9ojC6ANB3RaN1n+eAI1hs0DZSzayx+/eUuVj1aKmK44uUIYn/5wyWfcjhd/dUvxqJjpE
         nFtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740650861; x=1741255661;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lHQRWQJHJt80gVTv/WssWxcrsPw0Wlw1SM3KJrgvUyg=;
        b=TcRzQmr67AW+DVBMyzaaW56wSg5/wrWBExeWVjGxydkIZ497ihEpijVofgy6sy0gEx
         0Aq3WnmVxW+CkunNxyMPOV+t9sreQVkZ+gKtfYewAXuQ78D3TALnvM7raYgexyeH0KKq
         zT4VCuSfvxU2v/9Ea6VfRRcDGRSlfSHLcidgyMdmUjkSwsGkWsDcxrXOX2InXgNEKTIN
         gBGHpK7DRP0txUviUfWKaP8WIJjj+bljXy9lf+Cy/PDTv5RVYQvcQ5B1YHgqrFOYcs+L
         EXEWgdAzOPvByQK77SoIqq50R0g5KJUedgBek4lwwcDn+fgRm12BH/q8YuRPbr2uGhIT
         pG2Q==
X-Forwarded-Encrypted: i=1; AJvYcCXgO/Xs2Lwg+hL4WvgzCLORBE5YW+4MfA5XjAs77+1PVq5lyin+rOx5j9sgjrBkkF8o/PzZeY9BUEs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5GCFD8S0qPc1WUMmgMWW0YS98DgLmQfY3xcCdDDoqgEDoiyOa
	BuG7FJjQQxMPB67Ir+boLcyDOMgXKEt7UIdhvmiI0l7EmKogYjNMnkUuOd8DRac=
X-Gm-Gg: ASbGncvOy1LBEFYNNySn98gAr2gRW8GQnvFuHEtZk255BVx6nVhQ2IaBMP/e1YKgTK2
	YV0EgkOrNkCCN+AYJiUCyEYDC1RKcyUkZA1T/SgI17W3VhQCzJGuckJF/vAJSkvOhwh7aRZLFVc
	kNj4zp5t3n8K62gkb0gPd00+xNLtzaT1/y+LkfTg3uexkDDoNtki7Nj6e8Jhc2X4rKgpT5GZ++0
	olJyj9yyL9O3hiT+y7rENPVzMT8Zlz3TkUsk6xIgDtm3ZNpD0fS+pRr32DKL4hCZ2B6JLsOZWEe
	+WGCX6FIaNG+s/Tyt5MBs4YpeA==
X-Google-Smtp-Source: AGHT+IEkdD4wSxsnhnApw9fAgVyEZv/IRiTUOLhTYqm3TeaCryLGDoYSdKNAF+blkPnakgUAQ5Dl7Q==
X-Received: by 2002:a05:600c:3506:b0:439:91dd:cfaf with SMTP id 5b1f17b1804b1-43ab8fe936emr57078415e9.18.1740650860767;
        Thu, 27 Feb 2025 02:07:40 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:ede3:f33f:7555:723d])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-390e485dba4sm1532203f8f.92.2025.02.27.02.07.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 02:07:40 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Kevin Hilman <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  Michael Turquette
 <mturquette@baylibre.com>,  Neil Armstrong <neil.armstrong@linaro.org>,
  linux-clk@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-amlogic@lists.infradead.org,  linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 1/4] clk: add a clk_hw helpers to get the clock
 device or device_node
In-Reply-To: <508a5ee6c6b365e8d9cdefd5a9eec769.sboyd@kernel.org> (Stephen
	Boyd's message of "Wed, 26 Feb 2025 17:01:05 -0800")
References: <20250120-amlogic-clk-drop-clk-regmap-tables-v3-0-126244146947@baylibre.com>
	<20250120-amlogic-clk-drop-clk-regmap-tables-v3-1-126244146947@baylibre.com>
	<508a5ee6c6b365e8d9cdefd5a9eec769.sboyd@kernel.org>
User-Agent: mu4e 1.12.8; emacs 29.4
Date: Thu, 27 Feb 2025 11:07:39 +0100
Message-ID: <1jjz9bg0pg.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Wed 26 Feb 2025 at 17:01, Stephen Boyd <sboyd@kernel.org> wrote:

> Quoting Jerome Brunet (2025-01-20 09:15:30)
>> Add helpers to get the device or device_node associated with clk_hw.
>> 
>> This can be used by clock drivers to access various device related
>> functionality such as devres, dev_ prints, etc ...
>> 
>> Add test for these new helpers in clk-test.
>> 
>> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>> ---
>
> Thanks for adding tests!
>
>> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
>> index 9b45fa005030f56e1478b9742715ebcde898133f..9818f87c1c56ab9a3782c2fd55d3f602041769c3 100644
>> --- a/drivers/clk/clk.c
>> +++ b/drivers/clk/clk.c
>> @@ -365,6 +365,39 @@ const char *clk_hw_get_name(const struct clk_hw *hw)
>>  }
>>  EXPORT_SYMBOL_GPL(clk_hw_get_name);
>>  
>> +/**
>> + * clk_hw_get_dev - get device from an hardware clock.
>
> Please add () to indicate function.
>
>> + * @hw: the clk_hw pointer to get the struct device from
>> + *
>> + * This is a helper to get the struct device associated with a hardware
>> + * clock. Some clocks, such as the ones registered from an early clock
>> + * controller, may not be associated with any struct device.
>
> Maybe write out that an 'early clock controller' is one that registers
> clks with CLK_OF_DECLARE() or otherwise didn't pass a device pointer
> while registering the clk.

ok

>
>> + *
>> + * Return: the struct device associated with the clock, or NULL if there
>> + * is none.
>> + */
>> +struct device *clk_hw_get_dev(const struct clk_hw *hw)
>> +{
>> +       return hw->core->dev;
>
> Maybe we should increment the device refcount and require callers to
> put_device(). Now's our chance to make the change!

I'm afraid this would lead to a lot of boilerplate code and mis-management,
especially in the clock ops.

Would it be better if clock core took care of that, at least for the ops
part ? I mean incrementing and decrementing the ref count based on the
clk_hw registration. That would make things a lot easier for clock
users.

If the consumer of the API uses it for something that may outlive the
clk_hw, then it is up to it to properly increment the ref count since it
is clearly not clock stuff.

Same would go for the of_node.

>
>> +}
>> +EXPORT_SYMBOL_GPL(clk_hw_get_dev);
>> +
>> +/**
>> + * clk_hw_get_of_node - get device_node from an hardware clock.
>
> 'from a hardware' and remove the period.
>
>> + * @hw: the clk_hw pointer to get the struct device_node from
>> + *
>> + * This is a helper to get the struct device_node associated with an
>> + * hardware clock.
>> + *
>> + * Return: the struct device_node associated with the clock, or NULL
>> + * if there is none.
>> + */
>
> Can you put the kernel-doc in the header prototype? I want to move all
> the comments there so we can include the header in the rst doc file with
> the header 'clk provider API' or something like that.

Sure

>
>> +struct device_node *clk_hw_get_of_node(const struct clk_hw *hw)
>> +{
>> +       return hw->core->of_node;
>
> Maybe we should increment the of_node refcount and require callers to
> of_node_put(). Now's our chance to make the change!
>
>> +}
>> +EXPORT_SYMBOL_GPL(clk_hw_get_of_node);
>> +
>>  struct clk_hw *__clk_get_hw(struct clk *clk)
>>  {
>>         return !clk ? NULL : clk->core->hw;
>> diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
>> index f08feeaa3750bc86859294650de298762dea690a..4dcdde283598b7f940c653ebc0d5a5f4c27637a2 100644
>> --- a/drivers/clk/clk_test.c
>> +++ b/drivers/clk/clk_test.c
>> @@ -3077,6 +3084,80 @@ static struct kunit_suite clk_register_clk_parent_data_device_suite = {
>>         .test_cases = clk_register_clk_parent_data_device_test_cases,
>>  };
>>  
>> +static void clk_register_dummy_device_driver(struct kunit *test)
>> +{
>> +       static const struct of_device_id match_table[] = {
>> +               { .compatible = "test,clk-dummy-device" },
>> +               { }
>> +       };
>> +
>> +       clk_register_of_device_driver(test, match_table);
>> +}
>> +
>> +/*
>> + * Test that a clk registered with a struct device can provide back the
>> + * struct device it was registered with.
>> + */
>> +static void clk_hw_get_dev_test(struct kunit *test)
>
> The name of the test can tell us what it expects:
>
> 	clk_hw_get_dev_with_dev_gets_dev()
> 	clk_hw_get_dev_null_dev_gets_null()
> 	clk_hw_get_dev_with_node_gets_null() # this one uses of_clk_hw_register()
> 	clk_hw_get_of_node_with_dev_gets_node() # this one uses clk_hw_register()
> 	clk_hw_get_of_node_with_node_gets_node()
> 	clk_hw_get_of_node_null_node_gets_null()
>
> I put some more test names. If we use gen params we can have spaces in
> the name.
>
>> +{
>> +       struct clk_register_device_ctx *ctx;
>> +
>> +       ctx = kunit_kzalloc(test, sizeof(*ctx), GFP_KERNEL);
>> +       KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
>> +       test->priv = ctx;
>> +
>> +       clk_register_dummy_device_driver(test);
>> +       ctx->hw.init = CLK_HW_INIT_NO_PARENT("test_get_dev",
>> +                                            &clk_dummy_rate_ops, 0);
>> +
>> +       KUNIT_ASSERT_EQ(test, 0, clk_hw_register_kunit(test, ctx->dev, &ctx->hw));
>
> Please put a newline between the assertions and the expectation. That
> makes it easier to see at a glance what's expected by the test.
>
>> +       KUNIT_EXPECT_PTR_EQ(test, ctx->dev, clk_hw_get_dev(&ctx->hw));
>> +}
>> +
>> +/*
>> + * Test that a clk registered with a struct device_node can provide back the
>> + * struct device_node it was registered with.
>> + */
>> +static void clk_hw_get_of_node_test(struct kunit *test)
>> +{
>> +       struct device_node *np;
>> +       struct clk_hw *hw;
>> +
>> +       hw = kunit_kzalloc(test, sizeof(*hw), GFP_KERNEL);
>> +       KUNIT_ASSERT_NOT_ERR_OR_NULL(test, hw);
>> +
>> +       np = of_find_compatible_node(NULL, NULL, "test,clk-dummy-device");
>> +       hw->init = CLK_HW_INIT_NO_PARENT("test_get_of_node",
>> +                                        &clk_dummy_rate_ops, 0);
>> +       of_node_put_kunit(test, np);
>> +
>> +       KUNIT_ASSERT_EQ(test, 0, of_clk_hw_register_kunit(test, np, hw));
>
> The stuff before the expectation should likely go to the init function.
> Or it can use the genparams stuff so we can set some struct members to
> indicate if the pointer should be NULL or not and then twist through the
> code a couple times.
>
>> +       KUNIT_EXPECT_PTR_EQ(test, np, clk_hw_get_of_node(hw));
>> +}
>> +
>> +static struct kunit_case clk_hw_test_cases[] = {
>> +       KUNIT_CASE(clk_hw_get_dev_test),
>> +       KUNIT_CASE(clk_hw_get_of_node_test),
>
> Please add tests for the absence of the pointers.
>
>> +       {}
>> +};
>> +
>> +static int clk_hw_test_init(struct kunit *test)
>> +{
>> +       KUNIT_ASSERT_EQ(test, 0,
>> +                       of_overlay_apply_kunit(test, kunit_clk_dummy_device));
>> +
>> +       return 0;
>> +}
>> +
>> +/*
>> + * Test suite to verify the sanity clk_hw helper functions.
>
> Test suite to verify clk_hw_get_dev() and clk_hw_get_of_node().
>
>> + */
>> +static struct kunit_suite clk_hw_test_suite = {
>
> A better name is clk_hw_get_dev_of_node_suite
>
>> +       .name = "clk_hw_test_suite",
>
> Same, clk_hw_get_dev_of_node_suite.
>
>> +       .init = clk_hw_test_init,
>> +       .test_cases = clk_hw_test_cases,
>> +};
>> +
>>  struct clk_assigned_rates_context {
>>         struct clk_dummy_context clk0;
>>         struct clk_dummy_context clk1;
>> diff --git a/drivers/clk/kunit_clk_dummy_device.dtso b/drivers/clk/kunit_clk_dummy_device.dtso
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..5cc89aa11264428b09e47fd29c5f9ecfb8c32fdd
>> --- /dev/null
>> +++ b/drivers/clk/kunit_clk_dummy_device.dtso
>
> Ideally the name of the file gives a clue to the name of the test suite that
> uses it. Perhaps kunit_clk_hw_get_dev_of_node.dtso is better.
>
>> @@ -0,0 +1,10 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/dts-v1/;
>> +/plugin/;
>> +
>> +&{/} {
>> +       kunit-clock-controller {
>> +               compatible = "test,clk-dummy-device";
>
> Maybe "test,clk-hw-get-dev-node".
>
>> +               #clock-cells = <0>;
>> +       };
>> +};

-- 
Jerome

