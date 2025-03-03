Return-Path: <linux-clk+bounces-18817-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A99B3A4BEFB
	for <lists+linux-clk@lfdr.de>; Mon,  3 Mar 2025 12:39:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0D1D33BA79B
	for <lists+linux-clk@lfdr.de>; Mon,  3 Mar 2025 11:33:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88D781FC0FE;
	Mon,  3 Mar 2025 11:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jN9PZGmD"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4BAF1FBCA6
	for <linux-clk@vger.kernel.org>; Mon,  3 Mar 2025 11:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741001584; cv=none; b=Snmsc8+D2mSphxwIMMweVg1e7IuAnqOHRD71PAogjjGL/ZFv7OgiOY1NGRw0CIZ13ofvY78NKACu1Ik9czqAGF7+mePNj8qe7Ryga1Op/99mfevVDebRO7yxxRrP1Ty8xgA3FQfzYZx8Tijp5JChfvAyET1qO6uozZCqOPptYDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741001584; c=relaxed/simple;
	bh=Eg353t07fU74ciE+JZ7X5ZJ/CkZ0qqVRNJMc9SKnPtE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IxMSchCZGwhO89PWm3z0QbDEHkJ9GKjRSgTqrCybXaiR5kv70SuF+2JSPlG0murlDDRlJEu+kXDuJt5D9nJDEEZ8qzFb7AEbtlN/mzhYu0N65RJ29FtdLWKlo+THDaIGUWAG37jVr/u1Bt9wJwXGHUYMl4gqfldPWqS0L91OORU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jN9PZGmD; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-22359001f1aso94460605ad.3
        for <linux-clk@vger.kernel.org>; Mon, 03 Mar 2025 03:33:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741001582; x=1741606382; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ggBt1ChVoFiSdD425pBk+A/EhRbbIsMsC+P9KjmgXww=;
        b=jN9PZGmD34XZyQ0aAQoBAXBqyUE2VYXcOPzit0fOmSZcrhdOTwisyMByXh2h718B2a
         OFQrjlhLjGv4CribCXSk0qy/DkE8QN1bT9rQjqkeRn+ILlkgvUQlM/To3SWAWMfIL3ET
         geF+zdCiTObEUR/rSpQxRyMtoW3k2DLVelGbIss0ivAXGlwXVZDmvuGQqNWRf9/oS5Ud
         gZg8bIrsg9m5fVD8iz5e7GgQ7hxkvFtO+/hJ7EwKETYRYqlMArvk3LrbFGNyumIxQJ4C
         3/roB1T+nW/QqGWOG2Hg5lM0Tw54pL/PLFlh+Gwv+/lIL0ZzEi3VnB5AL4zIDto9yZ6O
         TheQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741001582; x=1741606382;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ggBt1ChVoFiSdD425pBk+A/EhRbbIsMsC+P9KjmgXww=;
        b=EODws0zXTo3mLagheFUnw+gcjjbeZkD9GC9G+PPXkr3xgMdnWuzh63p6Gc+DGtzJbz
         KJZ0uTHIm+43NSOZ9q1y8ifGrqd6P2I0tCuHm+C0JAqn6oPNU57gZodeD0EmgDxRoTod
         ZCiErzBkfXDOToEQKUqb5eP3dGxgSwxCWS0rw4YKLreeo/zYWZ5olKlJsTq5OfgTq/vt
         LBp/pgoKCxJJf8Tcx+oH1D54KV5JZf8XKwr426GhJiuMPQ/eeGmKcQJhHIRHEabZ0iff
         aTPQsHyYNAiqYUr4Ye1q9u/kvT9NDJG2BlcvSXw3Wfs8cFT/8ifHzSgLGGKDTBZ5glyL
         7lNw==
X-Forwarded-Encrypted: i=1; AJvYcCUiZBwY79oqbhXzQK6hYm/upkS4YHbuM4viD9TUjOvqO0MJWx6HChBmVqN4vNodaoLKJNLuNm4whuI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4is29a6V3dls0FrjevsKpx/v7VSmLZiAfqZDLLvdjpqAkgRMJ
	z4d6ODlBSAwMTA3oV1MXrA5SJsgOgrgHtHH7KrGR2htYMeGLXPPtcknUPzFBY7A=
X-Gm-Gg: ASbGnct+daTO4aYCydtj191Ayn3e2v5kHeFqRRlAWj6Aj9+dEEf60Yar0CdAVDThW5y
	PrhM/lXvqR4UroYLARRssVFPhBxPONVlmT1pVcLuGoP3qIFe0A4vd6lTgKF4anN32w532OBN2KL
	QgeqBzaFwKb31sz/eGELHuJHn08Ppw1IOdrv4PssiWGvcTocV+7xClP9nSeIbciW4ZrcEbLcZKS
	sSW5tgFmhysyM1Hx35FxNf9qO/Opv/9lwihRg7+/KLX+byuE8q1JcZnI03u9U4WDBRWdsJOYmWn
	j//vccE/hYjKN484+XfT0ATwqK7KSh80fMi0EaELgC4SQA==
X-Google-Smtp-Source: AGHT+IGEzZUBy9SLEnvepRViZj5j7Mez0Iog8fNjE+S4BZ1dr1gWZEzqWvwJmEDVC0MakORBpgclaA==
X-Received: by 2002:a05:6a20:c781:b0:1ee:e2ac:516d with SMTP id adf61e73a8af0-1f2f4e01415mr25639754637.30.1741001582029;
        Mon, 03 Mar 2025 03:33:02 -0800 (PST)
Received: from localhost ([122.172.84.15])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-aee90c7e519sm6101068a12.61.2025.03.03.03.33.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 03:33:01 -0800 (PST)
Date: Mon, 3 Mar 2025 17:02:59 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Russell King <linux@armlinux.org.uk>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Daniel Almeida <daniel.almeida@collabora.com>
Subject: Re: [PATCH V3 2/2] rust: Add initial clk abstractions
Message-ID: <20250303113259.ybl3i6jfc5bwvk6r@vireshk-i7>
References: <cover.1740995194.git.viresh.kumar@linaro.org>
 <023e3061cc164087b9079a9f6cb7e9fbf286794e.1740995194.git.viresh.kumar@linaro.org>
 <CAH5fLggcPo9g7Ep22aUj+5t+zdUQqa96NopZa946nsN649PQ2g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAH5fLggcPo9g7Ep22aUj+5t+zdUQqa96NopZa946nsN649PQ2g@mail.gmail.com>

On 03-03-25, 11:04, Alice Ryhl wrote:
> > +/// A simple implementation of optional `Clk`.
> > +pub struct OptionalClk(Clk);
> 
> What is this?

This came up during review of the previous version [1]. A resource (clk in this
case) can be optional for a driver to work and such drivers call
clk_get_optional(). Similar APIs are present in other frameworks as well.

I was not sure if this should be implemented as a separate method in struct Clk
itself or like this.

> > +impl OptionalClk {
> > +    /// Gets optional clock corresponding to a device and a connection id and returns `Clk`.
> > +    pub fn get(dev: &Device, name: Option<&CStr>) -> Result<Self> {
> > +        let con_id = if let Some(name) = name {
> > +            name.as_ptr() as *const _
> > +        } else {
> > +            ptr::null()
> > +        };
> > +
> > +        // SAFETY: It is safe to call `clk_get_optional()` for a valid device pointer.
> > +        Ok(Self(Clk(from_err_ptr(unsafe {
> > +            bindings::clk_get_optional(dev.as_raw(), con_id)
> > +        })?)))
> > +    }
> > +}

-- 
viresh

[1] https://lore.kernel.org/all/20250221215931.GA134397-robh@kernel.org/

