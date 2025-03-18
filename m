Return-Path: <linux-clk+bounces-19539-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 16D6BA669F0
	for <lists+linux-clk@lfdr.de>; Tue, 18 Mar 2025 06:58:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5B49719A0BAA
	for <lists+linux-clk@lfdr.de>; Tue, 18 Mar 2025 05:58:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FEBC1A8F93;
	Tue, 18 Mar 2025 05:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="G1ee/kBb"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 642F21A316D
	for <linux-clk@vger.kernel.org>; Tue, 18 Mar 2025 05:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742277461; cv=none; b=lCPkXVUuu1yzrMi6CYAHhidHb8IuXhm78OAD0837fK47ArVdD4O5Q3Eqn9nxrGgSlNQES1YmCWBLBxtvEtIJIWO8FTCeatizg24/u3v80O6MfZ9VGPwo9+OPQRXGPvPcVnoEHwU9NP/EC2Ej3libRuNkn7CgEOZdu9v0vrn83Ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742277461; c=relaxed/simple;
	bh=QrGYM+L5VRLkQ+j1KGvIl8l8Rqjv58DYzTHE+ZFQouQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=egnKNHvNo/6bPRfINUO+H366nYpPmrssvDKQPaty7dqlFawGiykfVq7B4K4THv3Pez1VPZG7WV0MEhkNaWwUSCF4Tr4G4zY4n0HAiukNEsgTq2tbrenI8cNMeXDlE36r2YIdjXIqpfxf8efKxW71g9iK2B5q7t6UFj5o7Sv5NBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=G1ee/kBb; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2ff85fec403so4887235a91.1
        for <linux-clk@vger.kernel.org>; Mon, 17 Mar 2025 22:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742277459; x=1742882259; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FmL7pIbMMiy2GAmVDsrXc2GJuQ5W4DvWNxcEMGurfl8=;
        b=G1ee/kBbq1SIrCaojDUxMjNg6RkPWqL6M6yzpM7MErxovrLQZInhDFNjYqq9zL2pq5
         4q5Ulgo6V93E+Ud3ZkY6ebhidI6jFGR7MoriFt78by1SB1Q0NT45v3+3AkRRI0Wx4yr0
         sC+o68R069uSe0wTgszoqcI/c0CMyVXar2glXI/V2uhX71vSNXAzKlJSyoh6s1Tbcfrg
         avke2fthjFfGyJAMyLowJMsT2SZHs+p5yr9Bmsfo5qeh9st4B6RnuvR+sn0SivTLt5qv
         /qdqUWFLv84fe4QL7ECjRVxKRe0gOPUGUIjAVbc7RROw4i3fREYcMWMeoEF2jsacn1XA
         54XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742277459; x=1742882259;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FmL7pIbMMiy2GAmVDsrXc2GJuQ5W4DvWNxcEMGurfl8=;
        b=cYNf91LLLE89rQOl0XBbLaNRoCCtmC4WwdxBRhKJK4BYGRUgt8CkFbS56WX6bcPGp+
         L5do5RoToV32tGk+d4UlUGRd1EqMptUsfsEnRCDy5InnQu9h74XCfmJGINWwnCe17A9A
         jJuKc8uv4TkM+BVraK/J+XxQFYvI/rj75ChTCC6UgPdf7PwqzFW82zn0EdSy0qnYEJl5
         5baN+RS545mqSNKq0CxkSt9iqEFk0jo1GXUkKodnYR3ve/oRpnebG0V7+A4K1qdav47W
         0AlIXtJBqAxPpwh2vSIMfU+pcFhkj56mwmcsJEYDC5JX3s8D5cES+u9m1UqIveVyfrQl
         hLIw==
X-Forwarded-Encrypted: i=1; AJvYcCUDtXom1wX93V3/UaMU3PCW5QNdMrJ/7S56fs0PQZ7AHWA/ZKq8uGGIg68d20s1CxEFzLYQaU5XxZc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZ3dJuzArQd8P5Wbfbl4hXPg2/qNHLj/crzu3mUikhVpdaAbKn
	xZyRLhmIMNe2Wa48hUTjdtiKwKQk2bnkDFxKOIrOmWnDxrOWtjo1hKQstU3GeKs=
X-Gm-Gg: ASbGnctuXWFxoOjqNPulzIW3cP1z/x12ryb0QfM+EN7IobUaatxZ1/pUtjzhweIY96K
	nhsjHTfanIgYpBLZXc7FuDZmY1Z0fz7NL+zQwAHBDO8g+DSsbsSFU5QmutIPOF0zuzeMLxE9H3o
	RQYFEyY7bEArKc7eaQQRDloKzR8jV6r1HdF52+QlLYLUgLv39ZaC/PbJruwCqj6U5MIxSPPqZ2g
	X6YjSgff3IuLZH1nYr8HAVE1CK8wtEKFLipYC9G3RGDDpDkgPzBDDYMOw3woErB0x3DVY5RACFv
	qzKLPXtZQa7DJfJKl9ryRwsFzSnoRqHWRrOkI70suKA2hIZKaISv27zQ
X-Google-Smtp-Source: AGHT+IEC9NQ2yOrdmt0PgOHi4oRZiAiPgFCOCuR5B8vjjUWh8gMnxLOSMLr7K9VwHEsHj9N1k+70sg==
X-Received: by 2002:a05:6a21:1f8d:b0:1ee:b5f4:b1d7 with SMTP id adf61e73a8af0-1fa4f9540cbmr3373331637.7.1742277458694;
        Mon, 17 Mar 2025 22:57:38 -0700 (PDT)
Received: from localhost ([122.172.84.15])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73711695b88sm8631623b3a.152.2025.03.17.22.57.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 22:57:38 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
	Russell King <linux@armlinux.org.uk>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Daniel Almeida <daniel.almeida@collabora.com>
Subject: [PATCH V4 2/2] rust: Add initial clk abstractions
Date: Tue, 18 Mar 2025 11:27:15 +0530
Message-Id: <0ca7d18d792a6108cb82a3d32e0172f8e945c144.1742276963.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1742276963.git.viresh.kumar@linaro.org>
References: <cover.1742276963.git.viresh.kumar@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add initial abstractions for the clk APIs. These provide the minimal
functionality needed for common use cases, making them straightforward
to introduce in the first iteration.

These will be used by Rust based cpufreq / OPP layers to begin with.

Tested-by: Daniel Almeida <daniel.almeida@collabora.com>
Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 MAINTAINERS        |   1 +
 rust/kernel/clk.rs | 304 +++++++++++++++++++++++++++++++++++++++++++++
 rust/kernel/lib.rs |   2 +
 3 files changed, 307 insertions(+)
 create mode 100644 rust/kernel/clk.rs

diff --git a/MAINTAINERS b/MAINTAINERS
index 726110d3c988..96e2574f41c0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5779,6 +5779,7 @@ F:	include/linux/clk-pr*
 F:	include/linux/clk/
 F:	include/linux/of_clk.h
 F:	rust/helpers/clk.c
+F:	rust/kernel/clk.rs
 X:	drivers/clk/clkdev.c
 
 COMMON INTERNET FILE SYSTEM CLIENT (CIFS and SMB3)
diff --git a/rust/kernel/clk.rs b/rust/kernel/clk.rs
new file mode 100644
index 000000000000..52dbd6b5a050
--- /dev/null
+++ b/rust/kernel/clk.rs
@@ -0,0 +1,304 @@
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
+/// The frequency unit.
+///
+/// Represents a frequency in hertz, wrapping a [`c_ulong`] value.
+///
+/// ## Examples
+///
+/// ```
+/// use kernel::clk::Hertz;
+///
+/// let hz = 1_000_000_000;
+/// let rate = Hertz(hz);
+///
+/// assert_eq!(rate.as_hz(), hz);
+/// assert_eq!(rate, Hertz(hz));
+/// assert_eq!(rate, Hertz::from_khz(hz / 1_000));
+/// assert_eq!(rate, Hertz::from_mhz(hz / 1_000_000));
+/// assert_eq!(rate, Hertz::from_ghz(hz / 1_000_000_000));
+/// ```
+#[derive(Copy, Clone, PartialEq, Eq, Debug)]
+pub struct Hertz(pub c_ulong);
+
+impl Hertz {
+    /// Create a new instance from kilohertz (kHz)
+    pub fn from_khz(khz: c_ulong) -> Self {
+        Self(khz * 1_000)
+    }
+
+    /// Create a new instance from megahertz (MHz)
+    pub fn from_mhz(mhz: c_ulong) -> Self {
+        Self(mhz * 1_000_000)
+    }
+
+    /// Create a new instance from gigahertz (GHz)
+    pub fn from_ghz(ghz: c_ulong) -> Self {
+        Self(ghz * 1_000_000_000)
+    }
+
+    /// Get the frequency in hertz
+    pub fn as_hz(&self) -> c_ulong {
+        self.0
+    }
+}
+
+impl From<Hertz> for c_ulong {
+    fn from(freq: Hertz) -> Self {
+        freq.0
+    }
+}
+
+/// A reference-counted clock.
+///
+/// This represents the Rust abstraction for the C [`struct clk`].
+///
+/// # Invariants
+///
+/// A [`Clk`] instance holds either a pointer to a valid [`struct clk`] created by the C portion of
+/// the kernel or a NULL pointer.
+///
+/// Instances of this type are reference-counted. Calling [`Clk::get`] ensures that the allocation
+/// remains valid for the lifetime of the [`Clk`].
+///
+/// ## Examples
+///
+/// The following example demonstrates how to obtain and configure a clock for a device.
+///
+/// ```
+/// use kernel::c_str;
+/// use kernel::clk::{Clk, Hertz};
+/// use kernel::device::Device;
+/// use kernel::error::Result;
+///
+/// fn configure_clk(dev: &Device) -> Result {
+///     let clk = Clk::get(dev, Some(c_str!("apb_clk")))?;
+///
+///     clk.prepare_enable()?;
+///
+///     let expected_rate = Hertz::from_ghz(1);
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
+    /// Gets [`Clk`] corresponding to a [`Device`] and a connection id.
+    ///
+    /// Equivalent to the kernel's [`clk_get`] API.
+    ///
+    /// [`clk_get`]: https://docs.kernel.org/core-api/kernel-api.html#c.clk_get
+    pub fn get(dev: &Device, name: Option<&CStr>) -> Result<Self> {
+        let con_id = if let Some(name) = name {
+            name.as_ptr() as *const _
+        } else {
+            ptr::null()
+        };
+
+        // SAFETY: It is safe to call [`clk_get`] for a valid device pointer.
+        //
+        // INVARIANT: The reference-count is decremented when [`Clk`] goes out of scope.
+        Ok(Self(from_err_ptr(unsafe {
+            bindings::clk_get(dev.as_raw(), con_id)
+        })?))
+    }
+
+    /// Obtain the raw [`struct clk`] pointer.
+    #[inline]
+    pub fn as_raw(&self) -> *mut bindings::clk {
+        self.0
+    }
+
+    /// Enable the clock.
+    ///
+    /// Equivalent to the kernel's [`clk_enable`] API.
+    ///
+    /// [`clk_enable`]: https://docs.kernel.org/core-api/kernel-api.html#c.clk_enable
+    #[inline]
+    pub fn enable(&self) -> Result {
+        // SAFETY: By the type invariants, self.as_raw() is a valid argument for [`clk_enable`].
+        to_result(unsafe { bindings::clk_enable(self.as_raw()) })
+    }
+
+    /// Disable the clock.
+    ///
+    /// Equivalent to the kernel's [`clk_disable`] API.
+    ///
+    /// [`clk_disable`]: https://docs.kernel.org/core-api/kernel-api.html#c.clk_disable
+    #[inline]
+    pub fn disable(&self) {
+        // SAFETY: By the type invariants, self.as_raw() is a valid argument for [`clk_disable`].
+        unsafe { bindings::clk_disable(self.as_raw()) };
+    }
+
+    /// Prepare the clock.
+    ///
+    /// Equivalent to the kernel's [`clk_prepare`] API.
+    ///
+    /// [`clk_prepare`]: https://docs.kernel.org/core-api/kernel-api.html#c.clk_prepare
+    #[inline]
+    pub fn prepare(&self) -> Result {
+        // SAFETY: By the type invariants, self.as_raw() is a valid argument for [`clk_prepare`].
+        to_result(unsafe { bindings::clk_prepare(self.as_raw()) })
+    }
+
+    /// Unprepare the clock.
+    ///
+    /// Equivalent to the kernel's [`clk_unprepare`] API.
+    ///
+    /// [`clk_unprepare`]: https://docs.kernel.org/core-api/kernel-api.html#c.clk_unprepare
+    #[inline]
+    pub fn unprepare(&self) {
+        // SAFETY: By the type invariants, self.as_raw() is a valid argument for [`clk_unprepare`].
+        unsafe { bindings::clk_unprepare(self.as_raw()) };
+    }
+
+    /// Prepare and enable the clock.
+    ///
+    /// Equivalent to calling [`Clk::prepare`] followed by [`Clk::enable`].
+    #[inline]
+    pub fn prepare_enable(&self) -> Result {
+        // SAFETY: By the type invariants, self.as_raw() is a valid argument for
+        // [`clk_prepare_enable`].
+        to_result(unsafe { bindings::clk_prepare_enable(self.as_raw()) })
+    }
+
+    /// Disable and unprepare the clock.
+    ///
+    /// Equivalent to calling [`Clk::disable`] followed by [`Clk::unprepare`].
+    #[inline]
+    pub fn disable_unprepare(&self) {
+        // SAFETY: By the type invariants, self.as_raw() is a valid argument for
+        // [`clk_disable_unprepare`].
+        unsafe { bindings::clk_disable_unprepare(self.as_raw()) };
+    }
+
+    /// Get clock's rate.
+    ///
+    /// Equivalent to the kernel's [`clk_get_rate`] API.
+    ///
+    /// [`clk_get_rate`]: https://docs.kernel.org/core-api/kernel-api.html#c.clk_get_rate
+    #[inline]
+    pub fn rate(&self) -> Hertz {
+        // SAFETY: By the type invariants, self.as_raw() is a valid argument for [`clk_get_rate`].
+        Hertz(unsafe { bindings::clk_get_rate(self.as_raw()) })
+    }
+
+    /// Set clock's rate.
+    ///
+    /// Equivalent to the kernel's [`clk_set_rate`] API.
+    ///
+    /// [`clk_set_rate`]: https://docs.kernel.org/core-api/kernel-api.html#c.clk_set_rate
+    #[inline]
+    pub fn set_rate(&self, rate: Hertz) -> Result {
+        // SAFETY: By the type invariants, self.as_raw() is a valid argument for [`clk_set_rate`].
+        to_result(unsafe { bindings::clk_set_rate(self.as_raw(), rate.as_hz()) })
+    }
+}
+
+impl Drop for Clk {
+    fn drop(&mut self) {
+        // SAFETY: By the type invariants, self.as_raw() is a valid argument for [`clk_put`].
+        unsafe { bindings::clk_put(self.as_raw()) };
+    }
+}
+
+/// A reference-counted optional clock.
+///
+/// A lightweight wrapper around an optional [`Clk`]. An [`OptionalClk`] represents a [`Clk`] that
+/// a driver can function without but may improve performance or enable additional features when
+/// available.
+///
+/// # Invariants
+///
+/// An [`OptionalClk`] instance encapsulates a [`Clk`] with either a valid [`struct clk`] or `NULL`
+/// pointer.
+///
+/// Instances of this type are reference-counted. Calling [`OptionalClk::get`] ensures that the
+/// allocation remains valid for the lifetime of the [`OptionalClk`].
+///
+/// ## Examples
+///
+/// The following example demonstrates how to obtain and configure an optional clock for a device.
+/// The code functions correctly whether or not the clock is available.
+///
+/// ```
+/// use kernel::c_str;
+/// use kernel::clk::{OptionalClk, Hertz};
+/// use kernel::device::Device;
+/// use kernel::error::Result;
+///
+/// fn configure_clk(dev: &Device) -> Result {
+///     let clk = OptionalClk::get(dev, Some(c_str!("apb_clk")))?;
+///
+///     clk.prepare_enable()?;
+///
+///     let expected_rate = Hertz::from_ghz(1);
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
+    /// Gets [`OptionalClk`] corresponding to a [`Device`] and a connection id.
+    ///
+    /// Equivalent to the kernel's [`clk_get_optional`] API.
+    ///
+    /// [`clk_get_optional`]: https://docs.kernel.org/core-api/kernel-api.html#c.clk_get_optional
+    pub fn get(dev: &Device, name: Option<&CStr>) -> Result<Self> {
+        let con_id = if let Some(name) = name {
+            name.as_ptr() as *const _
+        } else {
+            ptr::null()
+        };
+
+        // SAFETY: It is safe to call [`clk_get_optional`] for a valid device pointer.
+        //
+        // INVARIANT: The reference-count is decremented when [`OptionalClk`] goes out of scope.
+        Ok(Self(Clk(from_err_ptr(unsafe {
+            bindings::clk_get_optional(dev.as_raw(), con_id)
+        })?)))
+    }
+}
+
+// Make [`OptionalClk`] behave like [`Clk`].
+impl Deref for OptionalClk {
+    type Target = Clk;
+
+    fn deref(&self) -> &Clk {
+        &self.0
+    }
+}
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 496ed32b0911..3748f954d71f 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -40,6 +40,8 @@
 pub mod block;
 #[doc(hidden)]
 pub mod build_assert;
+#[cfg(CONFIG_COMMON_CLK)]
+pub mod clk;
 pub mod cred;
 pub mod device;
 pub mod device_id;
-- 
2.31.1.272.g89b43f80a514


