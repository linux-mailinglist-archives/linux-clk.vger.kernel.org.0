Return-Path: <linux-clk+bounces-20691-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 49272A8B6EC
	for <lists+linux-clk@lfdr.de>; Wed, 16 Apr 2025 12:40:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 831643BE973
	for <lists+linux-clk@lfdr.de>; Wed, 16 Apr 2025 10:40:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D88E8238C3F;
	Wed, 16 Apr 2025 10:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JD+HC2/K"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 580F322FF4E
	for <linux-clk@vger.kernel.org>; Wed, 16 Apr 2025 10:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744800021; cv=none; b=rCF9DizDoNUbYuMdDxYlSvPiYYeOe/N8X87DmoyPdvuM3BHiI4ylGl5edHktEv0zjv/GQQLpTiBzNe8qStzJEwKODeEFT5E+5uthlXTRhS4aMIU8/73iHxhOD/wGpJrcZOqAf5lpNsdq7+zIRQU24/FhpRh3oaLfnrUZzDhPWYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744800021; c=relaxed/simple;
	bh=AW7LAXhV4M8nrRRBsTVlNww4j59JMk/7529JME2B/rc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h1fb/ygf9dDHI5vxy8eEPAtfGpPOkLZbdvgG+DXwoPO0TSTurzc483iU68GxJJOmEElyER8wwY89nsUBnwzqYGsNjYxiA4iZQY+FBiBe21OOlZskPF2Iy9pyffbn0ODa9nB8VcUHCq5HDWtV7wk1NVAadkNgmxr0yls+bHRXU9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JD+HC2/K; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-73c17c770a7so1968195b3a.2
        for <linux-clk@vger.kernel.org>; Wed, 16 Apr 2025 03:40:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744800018; x=1745404818; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ttWNacvPGMYQA86vkqzo9EZOaHGhJM4Jor7D4v7bz+0=;
        b=JD+HC2/KLl5Kw1IwDPOQX1FlAefqYt5X4wCei0hd2eRydlFAvDFGe5D872rawwIKpb
         tp5hIEPbOxZdeMzAsYCu9B7HUXtxXErxMBAqaCtE6NpMOP+epDQIx6bTe8VSaQThnFvX
         YNgbTWwtKQ258NojH3FFi+DYLcIWIeEXFTReA9k89RMiOV7csOOHBkWMXGtY0slfGQ7f
         lLTOKdoPwDdrSTTXLhqagSTfbp0wr70b+A9Dk0vj+SlqbFNJX9rGdHKAKeEXg549PWp1
         Y2Vb4Ta8yi3b66F6coUD0kfIMJXDTOpBbnqaoRL50Lv1YM+3yMCPYV8oCmCh7KZQsRYZ
         hnyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744800018; x=1745404818;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ttWNacvPGMYQA86vkqzo9EZOaHGhJM4Jor7D4v7bz+0=;
        b=uLdnGrGOC1e8KnHHG9yfoideDd+qfqj9pVhk6f9YmG+QDU9IMAcuHm8InJJRktK7S/
         06vFbYSz5EwTx3h9c0V2PyaDR9pJqzJs08jwFZCHqJo0LMV/GOXJklBOm1zMu01hSuD4
         xCmuyfPAS7kkhSft1iIvyPA2+jVBMN1F+lC3uZlo3hDesbqqmMk7yvoaS+/Yyhfxy7Qy
         3/vHL+PdapMDlXGM52UtZ2RMIACwY/GjRMqTsyOldYVvkz3/Y6w9a1AAysPweU2EhOrp
         VX9vZtx+MMl7Fnm2vDmSxXJi5J+G82Otqr4l2LHF9x/G47DntHKOgVPPEJR1nJA/3bQa
         IAcw==
X-Forwarded-Encrypted: i=1; AJvYcCWSxClnjt/evM5UU3DAglSYqVTwbtZRUvFhKHsIQ6aMm6syIQxRHRLhC8pYmKGPNQ+o1adAgYcvmJs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzcOJzWnluTuVkAS95y2AAUras3LPrAlLAGC1aLh8ymSpFIVhTX
	oaGhPXp1XH8ZvTX9zW4n3orBjoDM1PS9hUr+mdHrJ7AZIUbOya4kBYBBLsZpGhs=
X-Gm-Gg: ASbGnctkmygoCENe17sPydQDKB9SoqBkxpwzzVlTRd4lNwUnUDhmNktlpZfrVQtGMtP
	D+AMDkylxKWcc0ZNTklPHX4tPooPXUUQdHxg2oDUfowqcFwiz2j3rrwgIOgOeP03wHJAV0Z9nQ5
	E5VcmemyMVgGa6zsUu2eD87xZScIc8goXeUZgUxteYntYN/YSuG/Zx+Zp5fJBZzTxNVB/XhlvI8
	Q8MY9iGGee7XG+n8rg2ARdOiOY6UWHVb+VfmSD3iZ1MT5t8/k/laTW00hBOZ++uU1j+WPT9t/57
	rAu/9Ns6g6baITsIHcREt+vh4DAQ6hos4pbKQ+vdlw==
X-Google-Smtp-Source: AGHT+IGwBbJAub8B5aJaGw+Dq2HNzt5OaEsdk5WiMT3ZEcrD7+h/HrHX+IN/nBZbxfI2sbK6SePbFw==
X-Received: by 2002:a05:6a20:9c8a:b0:1f5:8eb1:d5d2 with SMTP id adf61e73a8af0-203b3e90173mr1985396637.13.1744800018636;
        Wed, 16 Apr 2025 03:40:18 -0700 (PDT)
Received: from localhost ([122.172.83.32])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b0b2221e78csm808883a12.73.2025.04.16.03.40.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 03:40:18 -0700 (PDT)
Date: Wed, 16 Apr 2025 16:10:16 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Danilo Krummrich <dakr@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@redhat.com>,
	Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
	Stephen Boyd <sboyd@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	linux-pm@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	rust-for-linux@vger.kernel.org,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Joakim Bech <joakim.bech@linaro.org>, Rob Herring <robh@kernel.org>,
	Yury Norov <yury.norov@gmail.com>, Burak Emir <bqe@google.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Russell King <linux@armlinux.org.uk>, linux-clk@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V10 14/15] rust: opp: Extend OPP abstractions with
 cpufreq support
Message-ID: <20250416104016.mkzyitdm4moz4qts@vireshk-i7>
References: <cover.1744783509.git.viresh.kumar@linaro.org>
 <a940d1b1a02d99fdc80ba8d0526c35a776854cb3.1744783509.git.viresh.kumar@linaro.org>
 <Z_9v24SghlIhT62r@pollux>
 <20250416095943.f3jxy55bamekscst@vireshk-i7>
 <CANiq72=MQmUop5UzeeN-r7gAE0ep8Z+EUaLuA6exeazhZCHqLw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72=MQmUop5UzeeN-r7gAE0ep8Z+EUaLuA6exeazhZCHqLw@mail.gmail.com>

On 16-04-25, 12:31, Miguel Ojeda wrote:
> On Wed, Apr 16, 2025 at 11:59 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> >
> > +// Frequency table implementation.
> 
> ///
> 
> > +        // Returns a reference to the underlying [`cpufreq::Table`].
> 
> Ditto.

Hmm, I did not use /// as the comments were added to private
definitions.

Sorry for the dumb question, but why should we use /// in such cases ?
They will never show up in documentation anyway, right ?

-- 
viresh

