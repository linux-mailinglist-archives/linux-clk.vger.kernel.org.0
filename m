Return-Path: <linux-clk+bounces-20722-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C82DEA91621
	for <lists+linux-clk@lfdr.de>; Thu, 17 Apr 2025 10:08:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A72F7440DF8
	for <lists+linux-clk@lfdr.de>; Thu, 17 Apr 2025 08:08:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73AA022D7B1;
	Thu, 17 Apr 2025 08:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XIW1+F8c"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5C6D21ADDB
	for <linux-clk@vger.kernel.org>; Thu, 17 Apr 2025 08:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744877305; cv=none; b=N2ESJAiJvj6IhyBjKAKweCnil2LAyldZwQRzeWHmhltrNQWt40vLwZEUQmILcvvS+YzYWLozwQhrSslykLARi6esJFBnlk9FY08YAzrB7icoOz6XrAYGEQlKWNiVnEI76j2CzKsa0Gtvv+bp15+TfSrMyQseC3kehUho0/BMlug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744877305; c=relaxed/simple;
	bh=4cF367okumOtMyrY+/1TraFd2LxC9LrQ9zF2MGTBNSI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lFYKS74sOEi4mY08sdeqWunEdVLBA+1w7csIvMRgTlK/zroz2yfiAAmNhgePDfzNzABROvYvsETq5lr0KH2RvLdgVQA986Cb/vLUqIBDD1Y3sBsL2E+t++qRrXSRF6LYy+CcGabr94bLY7lgMOkRrZGhokCpOvNk4VitGsfNtOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XIW1+F8c; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-224019ad9edso8144185ad.1
        for <linux-clk@vger.kernel.org>; Thu, 17 Apr 2025 01:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744877303; x=1745482103; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QEswYqyGTpfH/GkJDbyZKkriSMlUpRORadm4MA53jxA=;
        b=XIW1+F8c/RmcAocej3ZzD/IboDijfcNsukkc252fAakXKYywZFa/q2sUDPMMo6QGsW
         hfY8sCcvw6b2ucsIWaiHuM7pL7zLTqhIigZW3ic20aeAP8X7/HA9DRCcXqApUgkSaWgP
         Nx38T7la54YWktmAKPRLyuRgDpxzmUu3foag4V/T7HSYau/Gm2OoeeB6j9UPZhWYTT/8
         Pu3ftnaOKwX3T3VOvxP6fKutbHCIIw244Rp48wf+FDmNZpxLkHsJgZ2N2qbxUi9me+/U
         gETu6hHk//hz5i8ZsDoQKVZ5Q4biGenvnIfWiQ+RKFtWxc7h78dYdJYO4CONmPsaMlWN
         l/Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744877303; x=1745482103;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QEswYqyGTpfH/GkJDbyZKkriSMlUpRORadm4MA53jxA=;
        b=EPtV/6kk8aEpuABiJduYI4I1MbnOtbXUHTfNqUsgKlI3zBJz0+SANBdqSBDPc3yvtK
         fAtDfP9reJKlGQh/GXtSe6Leo2i4HjMWOpm3TdQzweF7wu16vQm5oVV535vTzBBNbxe/
         ++kqivFV8CNAsEHYxdo67cr+MpFgt5SSpyEhSgvFGXOztOdvWLqDLLS/xH/Km9/zEc3F
         crEhOlVWSibyE/U2QmbsUMrS70es7EKcvhlD+KeNlwHq1wNwX5kahXjwcwAexNGYixKu
         Bu3F8Ttp2iSC1Ym+RhusEyOX6OwacnLAmUARlAZj1PqWc59JlPz+R4SXtIve0B2T/3Gq
         InIg==
X-Forwarded-Encrypted: i=1; AJvYcCU9YWyROZ7JEhHovDeCl5RR4eOOBeyni8XLVYYyreylLgflhbGECY/E0IV5IR8rCsLipwVB1rlxnBA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzofXZHGgINkA1r6YEvz5aSnAo0FaRVShH0TZ0/pTJaLjO93LFp
	pMC1FUFYIjwITOkuXUdc34d9QyaUIVdh8C2PYV4cQqgdx2mcNLukwWZjg8Ly/2A=
X-Gm-Gg: ASbGncuWjuE1MfSlcZlyWeKIJszh+1XEUo68r25PuxVp4kppk43qF1Ad4c0VcxTUWKJ
	1cRd38l4R8jIwqzJUOzhyaDl49yAizlwJX6PkifOSyihmL5d9/GPhIQIv9bXGFDvtNbhgNG/dlf
	zdaULLj/w+Xk3JyanSoiABKO6uj3dIjUvtPlPaauj74MifeUt5sdzwVZvMfWYjLn1KjJGJdbPvw
	TEG2Tqp6xkQCLsiaasstgqb/doygOHzcorD7Dw4tZjqMCrJCxi8DRA0MauxYgXhG09Qt2TAHUJg
	hj3DXW8p4RClxSGD/U2v/UOdjxFJ9sqK3Ia/lWiZ/A==
X-Google-Smtp-Source: AGHT+IGbQUi7VXIrD1diQICyOW/Hg7ynTMZy+UxNRxvbnJKiuF+BWnPMCK+kOiADSqf+l9bWIgL3Uw==
X-Received: by 2002:a17:903:3d06:b0:220:c164:6ee1 with SMTP id d9443c01a7336-22c3596beebmr89236705ad.32.1744877303213;
        Thu, 17 Apr 2025 01:08:23 -0700 (PDT)
Received: from localhost ([122.172.83.32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c33fe98d9sm27413715ad.250.2025.04.17.01.08.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 01:08:22 -0700 (PDT)
Date: Thu, 17 Apr 2025 13:38:20 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Benno Lossin <benno.lossin@proton.me>
Cc: Danilo Krummrich <dakr@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Danilo Krummrich <dakr@redhat.com>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	linux-pm@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Stephen Boyd <sboyd@kernel.org>, Nishanth Menon <nm@ti.com>,
	rust-for-linux@vger.kernel.org,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Joakim Bech <joakim.bech@linaro.org>, Rob Herring <robh@kernel.org>,
	Yury Norov <yury.norov@gmail.com>, Burak Emir <bqe@google.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Russell King <linux@armlinux.org.uk>, linux-clk@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V10 11/15] rust: cpufreq: Add initial abstractions for
 cpufreq framework
Message-ID: <20250417080820.zl4354gsmlmup4lv@vireshk-i7>
References: <cover.1744783509.git.viresh.kumar@linaro.org>
 <ac6854885277b23f100c6033fab51a080cdb70eb.1744783509.git.viresh.kumar@linaro.org>
 <Z_904KuBhKbO738_@pollux>
 <20250416093720.5nigxsirbvyiumcv@vireshk-i7>
 <D98R7PHH6TYX.2DUASKIXS5F8W@proton.me>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <D98R7PHH6TYX.2DUASKIXS5F8W@proton.me>

On 17-04-25, 08:00, Benno Lossin wrote:
> In the future, instead of using `allow`, you can try to use `expect`. It
> will warn, when the code is used.

Sure. Thanks.

-- 
viresh

