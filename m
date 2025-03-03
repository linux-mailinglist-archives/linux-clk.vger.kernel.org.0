Return-Path: <linux-clk+bounces-18929-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 08BC2A4EABB
	for <lists+linux-clk@lfdr.de>; Tue,  4 Mar 2025 19:11:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 58F6B421CB6
	for <lists+linux-clk@lfdr.de>; Tue,  4 Mar 2025 18:05:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C41E328F4;
	Tue,  4 Mar 2025 17:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jN9PZGmD"
X-Original-To: linux-clk@vger.kernel.org
Received: from beeline2.cc.itu.edu.tr (beeline2.cc.itu.edu.tr [160.75.25.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30AA3265600
	for <linux-clk@vger.kernel.org>; Tue,  4 Mar 2025 17:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=160.75.25.116
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741110333; cv=pass; b=Jq6q2SJY8bkpdiimapubocI4bX8rUxsmKx1GgBPDv5x/3i/CGRhPaNFzDQuBrmq6EB8fHC1N6jroWr9kQ5FtoHqqL51cf3O0BQTlLKZTxsKF89erns/sPmO9kdjilJoITUHHo+DGWSzCLFlkrTS28qs7sn0n2mIPUSVApy3Sqis=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741110333; c=relaxed/simple;
	bh=Eg353t07fU74ciE+JZ7X5ZJ/CkZ0qqVRNJMc9SKnPtE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ti1q8GI3WsmouAlxjBtLmCkFJcNFGSqbdf2ITg+Amoj6fwraOkmsSAWePc9xUh1EM1o4EW87z+FnnbD+fn06n9VEnYm87g76gaNvfioY7I7kt4OgL2PBTXHqP3B6U4dreerMjhfYv+d2FfiIn5891+WB0B364j4rSA8U4rkZCrs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=none smtp.mailfrom=cc.itu.edu.tr; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jN9PZGmD; arc=none smtp.client-ip=209.85.214.182; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; arc=pass smtp.client-ip=160.75.25.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cc.itu.edu.tr
Received: from lesvatest1.cc.itu.edu.tr (lesvatest1.cc.itu.edu.tr [10.146.128.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by beeline2.cc.itu.edu.tr (Postfix) with ESMTPS id 6FFE840891B0
	for <linux-clk@vger.kernel.org>; Tue,  4 Mar 2025 20:45:30 +0300 (+03)
X-Envelope-From: <root@cc.itu.edu.tr>
Authentication-Results: lesvatest1.cc.itu.edu.tr;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=jN9PZGmD
Received: from lesva1.cc.itu.edu.tr (unknown [160.75.70.79])
	by lesvatest1.cc.itu.edu.tr (Postfix) with ESMTP id 4Z6dJP6dxvzFwd5
	for <linux-clk@vger.kernel.org>; Tue,  4 Mar 2025 17:25:41 +0300 (+03)
Received: by le1 (Postfix, from userid 0)
	id 81B2442735; Tue,  4 Mar 2025 17:25:34 +0300 (+03)
Authentication-Results: lesva1.cc.itu.edu.tr;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jN9PZGmD
X-Envelope-From: <linux-kernel+bounces-541590-bozkiru=itu.edu.tr@vger.kernel.org>
Authentication-Results: lesva2.cc.itu.edu.tr;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jN9PZGmD
Received: from fgw1.itu.edu.tr (fgw1.itu.edu.tr [160.75.25.103])
	by le2 (Postfix) with ESMTP id 1093E4224F
	for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 14:33:37 +0300 (+03)
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by fgw1.itu.edu.tr (Postfix) with SMTP id 56BF8305F789
	for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 14:33:36 +0300 (+03)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F00E37A4DEC
	for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 11:32:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3170F1FCF4F;
	Mon,  3 Mar 2025 11:33:07 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEAA81F4170
	for <linux-kernel@vger.kernel.org>; Mon,  3 Mar 2025 11:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741001584; cv=none; b=dsdMN9FhHcz0MM3e1Emsh7+y3fH2a+joK99HEoI8tgwVLrpXTK+Gl081hVLCdz2RJe2jG/KpM5TNtH8CB+maHQ2odaakdRHvNHy6UDErE/C9A3aybbv2JWX9j1FAJt0GsSs8jxZgMT9PPMyhrr5+Em+DLSNSGmURoE8id+u9p/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741001584; c=relaxed/simple;
	bh=Eg353t07fU74ciE+JZ7X5ZJ/CkZ0qqVRNJMc9SKnPtE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IxMSchCZGwhO89PWm3z0QbDEHkJ9GKjRSgTqrCybXaiR5kv70SuF+2JSPlG0murlDDRlJEu+kXDuJt5D9nJDEEZ8qzFb7AEbtlN/mzhYu0N65RJ29FtdLWKlo+THDaIGUWAG37jVr/u1Bt9wJwXGHUYMl4gqfldPWqS0L91OORU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jN9PZGmD; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-22113560c57so80432955ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 03 Mar 2025 03:33:02 -0800 (PST)
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
        b=i3BdGUHDdc00sGfbd1W9f/qzBrVsfFjtuVGzpWsBjJ1nHKSb5cIe2lTcfVmuwm5fwn
         KhNfsQ1YJdMfW9bQYdBpuWCXDcjUP26IFIl62WKaB+pKX1OzN81n1HuNYCT3FnY5p+s1
         VxptR6M/0pgt3HjwUbSGPB5vSa41D0horP/hWQapqR7euAvbZVUiKIH9RcQIF1BuBt55
         H9cAQtU0DIZ0ahWUVEYgP+TExMY4fpKnGHOEytYEijmccKBNPVFt9P4UkJ1LwaTNdCAZ
         BZ4dGbestbxVA5nBlWPM+MCOHiGsh7veZzSiGmK+QVMKlMHe68XoEYqlH0o/1iZdbs2S
         egKA==
X-Forwarded-Encrypted: i=1; AJvYcCWIHUtoe3kjlPvR5x/3A/MvzpWTwrcof14pXsFgdi6EaZC12/r963YRLlD6AtgU6Rnn/bSZxTI83ZGg8Oo=@vger.kernel.org
X-Gm-Message-State: AOJu0YygmjIzshsPa01Sy3rphwyglaHQkvflyiQWNTBV1tE8nkIpK+lX
	2GVfK360xQ8ZLeYnN3OojiUdDl4KugCf/rpuRKKoU6ore5nrWsm6AuNgSO1KdgY=
X-Gm-Gg: ASbGncuaQrBdjvgpxEFcSIJ9Saihj+L+k7tJqUosdQn+2bAQC+KEoTvzN9/ykZWIPls
	kel/fYLcd8Yudn21CBLgUUf4tc/OfuZirrKE+gZ6Zuun8yi02cFnd57HchnIwSlR6F9/WYmkgvi
	T2tO3//+HHwVHR9+IADQfmBsK9v5JH3JW6wSs9Pzf8r2uuHLgI4dy+J5Gx3rcb7fpafWtSP8OOt
	hGQtosH87mDQaEcifRl+XeekgFdjpwZBI75Cwc+Fvcz3ldFhL12GKliVs3e+ELqhl08fZaJ5zgi
	mRGC+GjWp/eE3g23NwweD7skuhM+tjYeRQazrN4lo6rFTw==
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
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAH5fLggcPo9g7Ep22aUj+5t+zdUQqa96NopZa946nsN649PQ2g@mail.gmail.com>
X-ITU-Libra-ESVA-Information: Please contact Istanbul Teknik Universitesi for more information
X-ITU-Libra-ESVA-ID: 4Z6dJP6dxvzFwd5
X-ITU-Libra-ESVA: No virus found
X-ITU-Libra-ESVA-From: root@cc.itu.edu.tr
X-ITU-Libra-ESVA-Watermark: 1741715022.88653@xQaxcbp7qErTlXlbyHS/0w
X-ITU-MailScanner-SpamCheck: not spam

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


