Return-Path: <linux-clk+bounces-2168-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 59556826EAD
	for <lists+linux-clk@lfdr.de>; Mon,  8 Jan 2024 13:46:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ECE4C1F21079
	for <lists+linux-clk@lfdr.de>; Mon,  8 Jan 2024 12:46:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA9A54643C;
	Mon,  8 Jan 2024 12:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eQ+yw43C"
X-Original-To: linux-clk@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5395C4654F
	for <linux-clk@vger.kernel.org>; Mon,  8 Jan 2024 12:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704717530;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wcBqJ4gQi01T4/8FG1chls4DvGk41aU6nAEhZRL/urw=;
	b=eQ+yw43CRoDm839IzDo7wm8I1QwxZA4ArCklxJyyc95zDLjC/Ao2Usyn6dzahFupYoOEv/
	RZQciABfNHdPdbBPQAv0kqVC7hMrUNFZbjjP+t4y22y5DN3oYSlFtvUo7UfZecKy8LBCTU
	pmYkw+zxtjXbmWiXob3W/Klq5xgF32g=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-539-YKrpOBUHMXqKNOKrSaELyA-1; Mon, 08 Jan 2024 07:38:49 -0500
X-MC-Unique: YKrpOBUHMXqKNOKrSaELyA-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-a27d13b85f0so73464566b.2
        for <linux-clk@vger.kernel.org>; Mon, 08 Jan 2024 04:38:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704717528; x=1705322328;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wcBqJ4gQi01T4/8FG1chls4DvGk41aU6nAEhZRL/urw=;
        b=P3fjA9I+6PgxuUnXbIqTu7pHqLcEgN9WkeSHtLhnYtE5jXcPo+P4MKqOqQkPkoksvp
         lEBckDx8DmO32/3nh7H4OrTy+L93z9i85ys092tyO0mLlGMsTEQaDkhEGwVScTLNNg0K
         MCgIze8ZAJ6TPojtxzt0EtaJjfGJ31t7dmHr73zXdd6tS9VczVn5Km6GDKSNYbaJkodn
         P5vMM2WsiMS8ZzZYWJJRI2bBJc5QExaAX2mwrgFjpFHVlEn/q01yssDN9a0hjanxNIfK
         XbVGbeSb3D3Sodb1iRUpFZePTv5LrwIWrwY0c0BNiIQ8Tw0KvaPLI8UhNIBduy/SA7Ca
         s1og==
X-Gm-Message-State: AOJu0YztAZQagYgqcZygHhA9gjlFI/LerIcGrO4voSj4meRNxivIC5tp
	d+XZuMDSGSXIJXlILX2qJdojZ58qR8x1F3SB4Hxrny+QKNOiW0o+tZqXVauhuCKgkv+R0QeJYUL
	a4XOQTUlePRGG4VUtiQSzcVtO4f/Z
X-Received: by 2002:a17:906:434f:b0:a28:d7b2:b91 with SMTP id z15-20020a170906434f00b00a28d7b20b91mr97106ejm.147.1704717528037;
        Mon, 08 Jan 2024 04:38:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGIoNjbV+ChsGFEihObheTcLWEqnctKaKzINGwtKkXj/gG8v43xp+CF8Y9TpUH37wqJKvaj1g==
X-Received: by 2002:a17:906:434f:b0:a28:d7b2:b91 with SMTP id z15-20020a170906434f00b00a28d7b20b91mr97099ejm.147.1704717527795;
        Mon, 08 Jan 2024 04:38:47 -0800 (PST)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id k27-20020a1709061c1b00b00a272de16f52sm3865664ejg.112.2024.01.08.04.38.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jan 2024 04:38:46 -0800 (PST)
Message-ID: <2d52116e-89c3-4b90-9f60-eff2f11c1a9d@redhat.com>
Date: Mon, 8 Jan 2024 13:38:46 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] platform/x86: pmc_atom: Check state of PMC managed
 devices on s2idle
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Johannes Stezenbach <js@sig21.net>, Takashi Iwai <tiwai@suse.de>,
 Andy Shevchenko <andy@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, "H . Peter Anvin"
 <hpa@zytor.com>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, platform-driver-x86@vger.kernel.org,
 x86@kernel.org, linux-clk@vger.kernel.org
References: <20240107140310.46512-1-hdegoede@redhat.com>
 <20240107140310.46512-4-hdegoede@redhat.com>
 <a4d814a2-66bd-6429-539c-196fabbf48ae@linux.intel.com>
 <d7342193-cd48-42d4-8967-52e3a1bf8d84@redhat.com>
In-Reply-To: <d7342193-cd48-42d4-8967-52e3a1bf8d84@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 1/8/24 13:25, Hans de Goede wrote:
> Hi,
> 
> On 1/8/24 12:18, Ilpo Järvinen wrote:
>> On Sun, 7 Jan 2024, Hans de Goede wrote:

<snip>

>>> +
>>> +	/* Low part */
>>> +	pmc_dev_state_check(d3_sts_0, m->d3_sts_0, func_dis, m->func_dis, false_pos_sts_0);
>>> +
>>> +	/* High part */
>>> +	pmc_dev_state_check(d3_sts_1, m->d3_sts_1, func_dis_2, m->func_dis_2, false_pos_sts_1);
>>
>> The variables are called _0 and _1 but the comment talks about "low" and 
>> "high", could these be made consistent such that variabless end into _lo & 
>> _hi ?
>>
>> After making that change, I don't think those comments add any value any 
>> further value to what is already plainly visible from the code itself.
> 
> Ack, I'll replace the _0 and _1 with _lo and _hi.

Correction the _0 and _1 actually match the name of the register address
defines, which in turn mach the data sheet names.

so instead of replacing _0 / _1 I have no dropped the /* Low part */
and /* High part */ comments since those are a bit off.

Regards,

Hans



