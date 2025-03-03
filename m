Return-Path: <linux-clk+bounces-18807-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 116DDA4BBA1
	for <lists+linux-clk@lfdr.de>; Mon,  3 Mar 2025 11:04:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8EBD03A5483
	for <lists+linux-clk@lfdr.de>; Mon,  3 Mar 2025 10:04:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 335FF1F0E2C;
	Mon,  3 Mar 2025 10:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pY+m9FKQ"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3595A1E570E
	for <linux-clk@vger.kernel.org>; Mon,  3 Mar 2025 10:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740996280; cv=none; b=YNv3eoHcmWIrv9Z3FiTuMljtwa7reVBOAZJpCoJEPH8cQplEAd9MIpGO0QjsRC2tybAhpx+JlVlb2H8M3kv1mV8tEy76++9QLuMQhiNLuCW4yreB2t0AD0uD/8kbFjfukwajftUaUw/D4M15K25JyeS+cR8jgi7NWj7BdBEIFOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740996280; c=relaxed/simple;
	bh=7jatznALkxiqBPL+NMCYO4jhDNWV0Puk67f6y/obF/Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bRn3u+aSq2aQqscTU8m/TdlP9mFlcNV4JRj3rh0XiLXoK8K2iF5BbTkhby2lQa/CXLqyuSUkzqvxod/U0u9dm7/2sDTi0gRwEovZsLai55xdK2pWL6t73jCcfihhEdEnCZ0NNrB2LDtyTjkbl08ymZZxEbv2QFsDxL+jJbM75kM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pY+m9FKQ; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-390f5f48eafso986274f8f.0
        for <linux-clk@vger.kernel.org>; Mon, 03 Mar 2025 02:04:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740996276; x=1741601076; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CZfm0COZB/L4TTnNAi8+cOMnMfkfk6c9qb6QWtBVoCs=;
        b=pY+m9FKQG8uaV/Na/0QCgzMHM437/e4VOvahD99H44M1/h65/d0lDXCBGWgcfBcbDo
         vF+ocpNlfbeeUxrN8CqoL/ij7qO2jHDDoaHcdoT+UEdXvzceAQx8uiRS4ogsd6D6LKsk
         bShdaG90BqB1LzSmrfj0mONkcqImMyk3DFzHNuI32I5uLxc03SZlnWRhHE6ulsyJKrdw
         iB3Lb1ZutbEGT/xAj2W/HUaDYuYcGIld+qlTaVtT0fte2JS/zqWaM7TNAj61551T94Jy
         a5WIq/wG3nOKXhD65iNK8kfEecq7EQGgImrB31iDxbgh2ryv4LCK9bbVr6cFQKq7pZ+L
         4/Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740996276; x=1741601076;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CZfm0COZB/L4TTnNAi8+cOMnMfkfk6c9qb6QWtBVoCs=;
        b=i8oA1WIpZUBftV3o/p5JX+KkHqNwfRAP7s4jbltDaJwsh7lsae7tfpiSH0CEjMBz7p
         +vI3TgBff+bY+EUSGndmNr7xWnzfiYIWoGDD3k6OVDNyRo/D7jE1nXlpC8Cpdu8dlh+/
         fDADpNFhSShgK2ZW7ck2JiVq/Hy72u45FI9S9e1lBzO0SlR9I7k40paWIavNO+yTcA1d
         0fGdddRsoIadRlFsexsKOsgnFAnOiGprfF1wzyBqtqgw1VWoqnWyc3p+W18ypf3H5ndl
         M1iRUjnOZi7mS8jU6ftm8lD8vrQzJpk/OHaHllrkz0GOcHRiGwmYCTLnWYZJcxw7GJ9R
         wUzg==
X-Forwarded-Encrypted: i=1; AJvYcCXSD7YFrMlPJ5zRCBXe1QEmWggHta1AD0DinCHSLg9xXPQx9sh2Kx7YTPvhIC6+tnUKPLqgrGd27Wc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxi1SLXxN4ifhOr3mW7s9QoZRUqvev11dKPkqYL3F+iob3JEEUE
	1NK3vwL9TbfHP7du2UUR6oWX2homLcuS5cDbZRZVyjTz4pqOqmvPBmzRc5yMi3B6wI9kb37vz5F
	OVm76DDZmJKfQKosOnV+cFlj8AyGYYt3NrQe6
X-Gm-Gg: ASbGncuptZUj+jmeafUyjiR2tYRUjZY8JWUWtgK8JieFM7IP9xkhHKKfCX8UKL0i4zd
	3das5X3xeom8ctI3Y4vCE57i95HwV5RsU4ERpilsV94ouDfqzelVWh7qh0AZEQ2WK2ombvOi9ew
	3+hYJAJVxQz4mRobLRLPgjv6z/nVheCLbRcb7MGHICeDSQd+eJ1FbvdaQw
X-Google-Smtp-Source: AGHT+IF6mYPjM2ZdG1TBhFws1xzfvflCivFfZUBo4SOc/4y/Zm8Qnq7qa1G7WknkW81HNcXY6VsNMMco8YsqzJRcRg8=
X-Received: by 2002:a5d:5f93:0:b0:38f:23f4:2d7a with SMTP id
 ffacd0b85a97d-390eca070a7mr10178653f8f.40.1740996275924; Mon, 03 Mar 2025
 02:04:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1740995194.git.viresh.kumar@linaro.org> <023e3061cc164087b9079a9f6cb7e9fbf286794e.1740995194.git.viresh.kumar@linaro.org>
In-Reply-To: <023e3061cc164087b9079a9f6cb7e9fbf286794e.1740995194.git.viresh.kumar@linaro.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 3 Mar 2025 11:04:24 +0100
X-Gm-Features: AQ5f1Jrv8CfkwtaCjmL4Tc9x8A7QhEGhB8E7QjwjYN-fWaS7PfezdipAC3EplYU
Message-ID: <CAH5fLggcPo9g7Ep22aUj+5t+zdUQqa96NopZa946nsN649PQ2g@mail.gmail.com>
Subject: Re: [PATCH V3 2/2] rust: Add initial clk abstractions
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Russell King <linux@armlinux.org.uk>, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Vincent Guittot <vincent.guittot@linaro.org>, Daniel Almeida <daniel.almeida@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 3, 2025 at 11:00=E2=80=AFAM Viresh Kumar <viresh.kumar@linaro.o=
rg> wrote:
>
> Add initial abstractions for the clk APIs. These provide the minimal
> functionality needed for common use cases, making them straightforward
> to introduce in the first iteration.
>
> These will be used by Rust based cpufreq / OPP layers to begin with.
>
> Tested-by: Daniel Almeida <daniel.almeida@collabora.com>
> Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>

Every function in this patch could be #[inline]. Otherwise rustc will
generate a bunch of wrapper functions that just forward a call into C.

>  MAINTAINERS        |   1 +
>  rust/kernel/clk.rs | 134 +++++++++++++++++++++++++++++++++++++++++++++
>  rust/kernel/lib.rs |   1 +
>  3 files changed, 136 insertions(+)
>  create mode 100644 rust/kernel/clk.rs
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 726110d3c988..96e2574f41c0 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -5779,6 +5779,7 @@ F:        include/linux/clk-pr*
>  F:     include/linux/clk/
>  F:     include/linux/of_clk.h
>  F:     rust/helpers/clk.c
> +F:     rust/kernel/clk.rs
>  X:     drivers/clk/clkdev.c
>
>  COMMON INTERNET FILE SYSTEM CLIENT (CIFS and SMB3)
> diff --git a/rust/kernel/clk.rs b/rust/kernel/clk.rs
> new file mode 100644
> index 000000000000..1fa5b7298373
> --- /dev/null
> +++ b/rust/kernel/clk.rs
> @@ -0,0 +1,134 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! Clock abstractions.
> +//!
> +//! C header: [`include/linux/clk.h`](srctree/include/linux/clk.h)
> +
> +use crate::{
> +    bindings,
> +    device::Device,
> +    error::{from_err_ptr, to_result, Result},
> +    prelude::*,
> +};
> +
> +use core::{ops::Deref, ptr};
> +
> +/// Frequency unit.
> +pub type Hertz =3D crate::ffi::c_ulong;
> +
> +/// A simple implementation of `struct clk` from the C code.
> +#[repr(transparent)]
> +pub struct Clk(*mut bindings::clk);

This needs an invariants section.

> +
> +impl Clk {
> +    /// Gets clock corresponding to a device and a connection id and ret=
urns `Clk`.
> +    pub fn get(dev: &Device, name: Option<&CStr>) -> Result<Self> {
> +        let con_id =3D if let Some(name) =3D name {
> +            name.as_ptr() as *const _
> +        } else {
> +            ptr::null()
> +        };
> +
> +        // SAFETY: It is safe to call `clk_get()` for a valid device poi=
nter.
> +        Ok(Self(from_err_ptr(unsafe {
> +            bindings::clk_get(dev.as_raw(), con_id)
> +        })?))
> +    }
> +
> +    /// Obtain the raw `struct clk *`.
> +    pub fn as_raw(&self) -> *mut bindings::clk {
> +        self.0
> +    }
> +
> +    /// Clock enable.
> +    pub fn enable(&self) -> Result<()> {
> +        // SAFETY: It is safe to call clk APIs of the C code for a clock=
 pointer earlier returned
> +        // by `clk_get()`.
> +        to_result(unsafe { bindings::clk_enable(self.as_raw()) })
> +    }
> +
> +    /// Clock disable.
> +    pub fn disable(&self) {
> +        // SAFETY: It is safe to call clk APIs of the C code for a clock=
 pointer earlier returned
> +        // by `clk_get()`.
> +        unsafe { bindings::clk_disable(self.as_raw()) };
> +    }
> +
> +    /// Clock prepare.
> +    pub fn prepare(&self) -> Result<()> {
> +        // SAFETY: It is safe to call clk APIs of the C code for a clock=
 pointer earlier returned
> +        // by `clk_get()`.
> +        to_result(unsafe { bindings::clk_prepare(self.as_raw()) })
> +    }
> +
> +    /// Clock unprepare.
> +    pub fn unprepare(&self) {
> +        // SAFETY: It is safe to call clk APIs of the C code for a clock=
 pointer earlier returned
> +        // by `clk_get()`.
> +        unsafe { bindings::clk_unprepare(self.as_raw()) };
> +    }
> +
> +    /// Clock prepare enable.
> +    pub fn prepare_enable(&self) -> Result<()> {
> +        // SAFETY: It is safe to call clk APIs of the C code for a clock=
 pointer earlier returned
> +        // by `clk_get()`.
> +        to_result(unsafe { bindings::clk_prepare_enable(self.as_raw()) }=
)
> +    }
> +
> +    /// Clock disable unprepare.
> +    pub fn disable_unprepare(&self) {
> +        // SAFETY: It is safe to call clk APIs of the C code for a clock=
 pointer earlier returned
> +        // by `clk_get()`.
> +        unsafe { bindings::clk_disable_unprepare(self.as_raw()) };
> +    }
> +
> +    /// Clock get rate.
> +    pub fn rate(&self) -> Hertz {
> +        // SAFETY: It is safe to call clk APIs of the C code for a clock=
 pointer earlier returned
> +        // by `clk_get()`.
> +        unsafe { bindings::clk_get_rate(self.as_raw()) }
> +    }
> +
> +    /// Clock set rate.
> +    pub fn set_rate(&self, rate: Hertz) -> Result<()> {
> +        // SAFETY: It is safe to call clk APIs of the C code for a clock=
 pointer earlier returned
> +        // by `clk_get()`.
> +        to_result(unsafe { bindings::clk_set_rate(self.as_raw(), rate) }=
)
> +    }
> +}
> +
> +impl Drop for Clk {
> +    fn drop(&mut self) {
> +        // SAFETY: It is safe to call clk APIs of the C code for a clock=
 pointer earlier returned
> +        // by `clk_get()`.
> +        unsafe { bindings::clk_put(self.as_raw()) };
> +    }
> +}
> +
> +/// A simple implementation of optional `Clk`.
> +pub struct OptionalClk(Clk);

What is this?

> +impl OptionalClk {
> +    /// Gets optional clock corresponding to a device and a connection i=
d and returns `Clk`.
> +    pub fn get(dev: &Device, name: Option<&CStr>) -> Result<Self> {
> +        let con_id =3D if let Some(name) =3D name {
> +            name.as_ptr() as *const _
> +        } else {
> +            ptr::null()
> +        };
> +
> +        // SAFETY: It is safe to call `clk_get_optional()` for a valid d=
evice pointer.
> +        Ok(Self(Clk(from_err_ptr(unsafe {
> +            bindings::clk_get_optional(dev.as_raw(), con_id)
> +        })?)))
> +    }
> +}
> +
> +// Make `OptionalClk` behave like `Clk`.
> +impl Deref for OptionalClk {
> +    type Target =3D Clk;
> +
> +    fn deref(&self) -> &Clk {
> +        &self.0
> +    }
> +}
> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> index 496ed32b0911..324b86f127a0 100644
> --- a/rust/kernel/lib.rs
> +++ b/rust/kernel/lib.rs
> @@ -40,6 +40,7 @@
>  pub mod block;
>  #[doc(hidden)]
>  pub mod build_assert;
> +pub mod clk;
>  pub mod cred;
>  pub mod device;
>  pub mod device_id;
> --
> 2.31.1.272.g89b43f80a514
>

