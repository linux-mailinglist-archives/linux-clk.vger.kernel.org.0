Return-Path: <linux-clk+bounces-18894-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 08371A4D726
	for <lists+linux-clk@lfdr.de>; Tue,  4 Mar 2025 10:00:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 62084188C13A
	for <lists+linux-clk@lfdr.de>; Tue,  4 Mar 2025 08:59:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C98B9203704;
	Tue,  4 Mar 2025 08:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="br+aWbNg"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A665320408A
	for <linux-clk@vger.kernel.org>; Tue,  4 Mar 2025 08:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741078437; cv=none; b=Kbw5kl0yHfw4jpLlndCL7pgtFshdF7iqb+A4qgfu2NH2sgLNo10IsrFHmS3gXFYGoyfwob/zzJdCFx0KGohMCtOMXqzA3TND7Sa2fHYftp24/AHmVB9ZySNnzg8eaElltZo/97yP4W4tSYmQtXLd2zb0ewQkKe9K+Py9xBvgK9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741078437; c=relaxed/simple;
	bh=wzgVeH2iZAgK+OV0AmNH5+torfAgfEWzdJZTvzH35RY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mWNAzY7PCgsL94Qubfsem69X+GfDLJE9kdB9m17/PhfvBfNk6a+PxsSnOXOX4QvPXYEPFGCNX3CbLvajXNt+cdwHRpKbeEZPZ/mcKBw1S+7QDZbqXpFcvT605NEpnXEzCiUyJLdmfwDxEKwXNatlwv5TIom2elVMOJb1Oe2hTMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=br+aWbNg; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2feb9078888so8634873a91.3
        for <linux-clk@vger.kernel.org>; Tue, 04 Mar 2025 00:53:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741078435; x=1741683235; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=E0x864LV9vrzBzd/PsD5RrZ/kDJqjI2owc7G6mwEbH0=;
        b=br+aWbNgaU5TNBEy7LA6bvRYNsXIRj6KMqH6MYZfQsjgOM3TP6M9d0PrOgNzTDdatL
         4kigRFO0ugoO1PgyB/1Uz7k7GDv9m6YaoYnbS5bYvhbqVT0UbllMn0K5rqz46tn3G/LK
         tm7hHEVs/zf0XabTvQyBtvwXeAivJLUcRFG7Ep4kbS7qboOZTlhCoRLcM/GsIv4mhsDW
         I1p4+gEUtnnpYang5mbleu49diq8qSd87Ii8C5zpccUJLD6FmyQ43zEtZRKjtDpq6Idf
         Kh45B7cvO7cr49xJ2go5s8jFCqKJWQo3VTGiW6DGS0SUfdvnyFNzHA0lI4tpPARi2SRX
         qqeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741078435; x=1741683235;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E0x864LV9vrzBzd/PsD5RrZ/kDJqjI2owc7G6mwEbH0=;
        b=XAukc85EGQ7j6kj3cd7PFeHti9aXsInQNFFoVL7PZWX2YxkhpdByrdxVp1SfduZDYO
         EDtKGDy6NyMnRsl/Sgbnj47dH1dA2547S1v9hT4z1hezKniknsAC3cXgVmxkv9MiBZfq
         vDQIuydwTXrZJqVvC4uMMQBSBH/Bhss/j5R1374fVsZ1bJpR9i2C1S6hE5dpvhH5DoeM
         4eEcgqfMeHnY0w9kjPHp45eNh0imyvwqyS+m9d21L5o/P/e8LXUyo0XjKhktjbriHblk
         f8T1Ts86N30iTvJOVNKQOuxQ+/2j4hQEpFxk2h18xrDZDEoEKxY6CvITq/tV+EX7LcgX
         dxQw==
X-Forwarded-Encrypted: i=1; AJvYcCWr2TrfMI50ti8Gf+grKH3qPavhDNvd2gJ/mBUFcdBY5OvOm6fVe3x7baWdz3IhCQ+Qa2RWRxp9g1s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0xW4pu4CauwSb7r7dsFGJ7cfNjR94shy2TrxSn+vocgQUrFXl
	TUKax3C4tUHIW4+iQATLBKsM3FWOefdsG8VPyNBjwkLbtqBdrWADUDykfG+Lemg=
X-Gm-Gg: ASbGncuhmj1104+1Y/s5t+PBArsIt1OzbI8W03+WIPh5yfP1LefboGaSVJwFJctSmk5
	zh3xEq7HTetxR+s7u5xygZWveErx9yBMEY9Myxf1aucJ4FMaI+95ShUr6cHiW1C3/ej7vaF/TeQ
	B5zWtOSMXRvU8QOFbLhHzXjB5GzoSbzadoSR+1CGNq/J40W7t68TZD3+tNJ5AZEBga/OEQogOE4
	yjWs3Fc6TX4k7WkClc5Mr6b5SZ9sovLzyVI10Wj2y4o2HYiml3wDpQEcgYc7UhFkRAgL5rWnImv
	N9AfQt5nhy/FsLb8hasqNoxS3RqaJ/03tVDoq2VrgCEyCA==
X-Google-Smtp-Source: AGHT+IFdFTTfqIOr3puUYW+t+84g8sQqcnrDMvn/JLyondd0YLc+BE2wI//6xrrG8j4UY3K/GoC9Rw==
X-Received: by 2002:a17:90b:3b85:b0:2f4:434d:c7ed with SMTP id 98e67ed59e1d1-2febab75e0bmr28826018a91.16.1741078434808;
        Tue, 04 Mar 2025 00:53:54 -0800 (PST)
Received: from localhost ([122.172.84.15])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fea696e3f0sm10429399a91.37.2025.03.04.00.53.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 00:53:54 -0800 (PST)
Date: Tue, 4 Mar 2025 14:23:51 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Russell King <linux@armlinux.org.uk>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Daniel Almeida <daniel.almeida@collabora.com>
Subject: Re: [PATCH V3 2/2] rust: Add initial clk abstractions
Message-ID: <20250304085351.inrvjgixvxla4yn3@vireshk-i7>
References: <cover.1740995194.git.viresh.kumar@linaro.org>
 <023e3061cc164087b9079a9f6cb7e9fbf286794e.1740995194.git.viresh.kumar@linaro.org>
 <CANiq72kdWzFOZ39EoFNxEAbk4KYgzLi1OAEc1zn8BM07VpXy3g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72kdWzFOZ39EoFNxEAbk4KYgzLi1OAEc1zn8BM07VpXy3g@mail.gmail.com>

On 03-03-25, 11:16, Miguel Ojeda wrote:
> On Mon, Mar 3, 2025 at 11:00 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> >
> > +/// Frequency unit.
> > +pub type Hertz = crate::ffi::c_ulong;
> 
> Do we want this to be an alias or would it make sense to take the
> chance to make this a newtype?

I have tried some improvements based on your (and Alice's comments), please see
if it looks any better now.

-- 
viresh

-------------------------8<-------------------------

diff --git a/rust/kernel/clk.rs b/rust/kernel/clk.rs
new file mode 100644
index 000000000000..fc3cb0f5f332
--- /dev/null
+++ b/rust/kernel/clk.rs
@@ -0,0 +1,232 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Clock abstractions.
+//!
+//! C header: [`include/linux/clk.h`](srctree/include/linux/clk.h)
+//!
+//! Reference: <https://docs.kernel.org/driver-api/clk.html>
+
+use crate::{
+    bindings,
+    device::Device,
+    error::{from_err_ptr, to_result, Result},
+    ffi::c_ulong,
+    prelude::*,
+};
+
+use core::{ops::Deref, ptr};
+
+/// Frequency unit.
+#[derive(Copy, Clone, PartialEq, Eq, Debug)]
+pub struct Hertz(c_ulong);
+
+impl Hertz {
+    /// Creates a new `Hertz` value.
+    pub fn new(freq: c_ulong) -> Self {
+        Hertz(freq)
+    }
+
+    /// Returns the frequency in `Hertz`.
+    pub fn value(self) -> c_ulong {
+        self.0
+    }
+}
+
+/// This structure represents the Rust abstraction for a C [`struct clk`].
+///
+/// # Invariants
+///
+/// A [`Clk`] instance always corresponds to a valid [`struct clk`] created by the C portion of the
+/// kernel.
+///
+/// Instances of this type are reference-counted. Calling `get` ensures that the allocation remains
+/// valid for the lifetime of the [`Clk`].
+///
+/// ## Example
+///
+/// The following example demonstrates how to obtain and configure a clock for a device.
+///
+/// ```
+/// use kernel::clk::{Clk, Hertz};
+/// use kernel::device::Device;
+/// use kernel::error::Result;
+///
+/// fn configure_clk(dev: &Device) -> Result {
+///     let clk = Clk::get(dev, "apb_clk")?;
+///
+///     clk.prepare_enable()?;
+///
+///     let expected_rate = Hertz::new(1_000_000_000);
+///
+///     if clk.rate() != expected_rate {
+///         clk.set_rate(expected_rate)?;
+///     }
+///
+///     clk.disable_unprepare();
+///     Ok(())
+/// }
+/// ```
+///
+/// [`struct clk`]: https://docs.kernel.org/driver-api/clk.html
+#[repr(transparent)]
+pub struct Clk(*mut bindings::clk);
+
+impl Clk {
+    /// Gets `Clk` corresponding to a [`Device`] and a connection id.
+    pub fn get(dev: &Device, name: Option<&CStr>) -> Result<Self> {
+        let con_id = if let Some(name) = name {
+            name.as_ptr() as *const _
+        } else {
+            ptr::null()
+        };
+
+        // SAFETY: It is safe to call `clk_get()` for a valid device pointer.
+        Ok(Self(from_err_ptr(unsafe {
+            bindings::clk_get(dev.as_raw(), con_id)
+        })?))
+    }
+
+    /// Obtain the raw `struct clk *`.
+    #[inline]
+    pub fn as_raw(&self) -> *mut bindings::clk {
+        self.0
+    }
+
+    /// Enable the clock.
+    #[inline]
+    pub fn enable(&self) -> Result {
+        // SAFETY: It is safe to call clk APIs of the C code for a clock pointer earlier returned
+        // by `clk_get()`.
+        to_result(unsafe { bindings::clk_enable(self.as_raw()) })
+    }
+
+    /// Disable the clock.
+    #[inline]
+    pub fn disable(&self) {
+        // SAFETY: It is safe to call clk APIs of the C code for a clock pointer earlier returned
+        // by `clk_get()`.
+        unsafe { bindings::clk_disable(self.as_raw()) };
+    }
+
+    /// Prepare the clock.
+    #[inline]
+    pub fn prepare(&self) -> Result {
+        // SAFETY: It is safe to call clk APIs of the C code for a clock pointer earlier returned
+        // by `clk_get()`.
+        to_result(unsafe { bindings::clk_prepare(self.as_raw()) })
+    }
+
+    /// Unprepare the clock.
+    #[inline]
+    pub fn unprepare(&self) {
+        // SAFETY: It is safe to call clk APIs of the C code for a clock pointer earlier returned
+        // by `clk_get()`.
+        unsafe { bindings::clk_unprepare(self.as_raw()) };
+    }
+
+    /// Prepare and enable the clock.
+    #[inline]
+    pub fn prepare_enable(&self) -> Result {
+        // SAFETY: It is safe to call clk APIs of the C code for a clock pointer earlier returned
+        // by `clk_get()`.
+        to_result(unsafe { bindings::clk_prepare_enable(self.as_raw()) })
+    }
+
+    /// Disable and unprepare the clock.
+    #[inline]
+    pub fn disable_unprepare(&self) {
+        // SAFETY: It is safe to call clk APIs of the C code for a clock pointer earlier returned
+        // by `clk_get()`.
+        unsafe { bindings::clk_disable_unprepare(self.as_raw()) };
+    }
+
+    /// Get clock's rate.
+    #[inline]
+    pub fn rate(&self) -> Hertz {
+        // SAFETY: It is safe to call clk APIs of the C code for a clock pointer earlier returned
+        // by `clk_get()`.
+        Hertz::new(unsafe { bindings::clk_get_rate(self.as_raw()) })
+    }
+
+    /// Set clock's rate.
+    #[inline]
+    pub fn set_rate(&self, rate: Hertz) -> Result {
+        // SAFETY: It is safe to call clk APIs of the C code for a clock pointer earlier returned
+        // by `clk_get()`.
+        to_result(unsafe { bindings::clk_set_rate(self.as_raw(), rate.value()) })
+    }
+}
+
+impl Drop for Clk {
+    fn drop(&mut self) {
+        // SAFETY: It is safe to call clk APIs of the C code for a clock pointer earlier returned
+        // by `clk_get()`.
+        unsafe { bindings::clk_put(self.as_raw()) };
+    }
+}
+
+/// A lightweight wrapper around an optional [`Clk`].
+///
+/// An `OptionalClk` represents a [`Clk`] that a driver can function without but may improve
+/// performance or enable additional features when available.
+///
+/// # Invariants
+///
+/// An `OptionalClk` instance encapsulates a [`Clk`] with either a valid or `NULL` [`struct clk`] pointer.
+///
+/// Instances of this type are reference-counted. Calling `get` ensures that the allocation remains
+/// valid for the lifetime of the `OptionalClk`.
+///
+/// ## Example
+///
+/// The following example demonstrates how to obtain and configure an optional clock for a device.
+/// The code functions correctly whether or not the clock is available.
+///
+/// ```
+/// use kernel::clk::{OptionalClk, Hertz};
+/// use kernel::device::Device;
+/// use kernel::error::Result;
+///
+/// fn configure_clk(dev: &Device) -> Result {
+///     let clk = OptionalClk::get(dev, "apb_clk")?;
+///
+///     clk.prepare_enable()?;
+///
+///     let expected_rate = Hertz::new(1_000_000_000);
+///
+///     if clk.rate() != expected_rate {
+///         clk.set_rate(expected_rate)?;
+///     }
+///
+///     clk.disable_unprepare();
+///     Ok(())
+/// }
+/// ```
+///
+/// [`struct clk`]: https://docs.kernel.org/driver-api/clk.html
+pub struct OptionalClk(Clk);
+
+impl OptionalClk {
+    /// Gets `OptionalClk` corresponding to a [`Device`] and a connection id.
+    pub fn get(dev: &Device, name: Option<&CStr>) -> Result<Self> {
+        let con_id = if let Some(name) = name {
+            name.as_ptr() as *const _
+        } else {
+            ptr::null()
+        };
+
+        // SAFETY: It is safe to call `clk_get_optional()` for a valid device pointer.
+        Ok(Self(Clk(from_err_ptr(unsafe {
+            bindings::clk_get_optional(dev.as_raw(), con_id)
+        })?)))
+    }
+}
+
+// Make `OptionalClk` behave like [`Clk`].
+impl Deref for OptionalClk {
+    type Target = Clk;
+
+    fn deref(&self) -> &Clk {
+        &self.0
+    }
+}

