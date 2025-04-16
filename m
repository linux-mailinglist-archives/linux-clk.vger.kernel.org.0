Return-Path: <linux-clk+bounces-20563-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BE538A87AF0
	for <lists+linux-clk@lfdr.de>; Mon, 14 Apr 2025 10:49:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7078F3B3727
	for <lists+linux-clk@lfdr.de>; Mon, 14 Apr 2025 08:48:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC1D2267391;
	Mon, 14 Apr 2025 08:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ncPOYfzi"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E366826657F
	for <linux-clk@vger.kernel.org>; Mon, 14 Apr 2025 08:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744620433; cv=none; b=Flt4MDjpZ+iImuKEvsrMgQTFxqzmEpM4igsq2ww0RwJVAezSk/Z69COrgUp0KAXBPXYoVcXW6soFByi5nAwJhyogyq+6zEdgwbLOGYy3Rpjay3Qw3a1KEes89w/es391wvMCE9QH77QZQR+t2aunhsIhzAIUH35eJF+aPDKg7O4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744620433; c=relaxed/simple;
	bh=ja8fzm+2+e0lQQH38W411ZdNZOj3B4rGyOIN9zlKg0g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=drTBAf/3G1R29QMl/x7DGqqaRldg4jquqgxvvwhBoHIGTNXHgVaIjtT47vQe+/DEEy83eaB9raNWQaHI/91RrlpUpfMX+CANZ6CW3oUnO0RchLqbYd+XV3TFVBYC5Pf3gl5PBHkcpIyOCtLBedOzoEgfNUy/mVd0TbxxJCEh6XA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ncPOYfzi; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2243803b776so58164395ad.0
        for <linux-clk@vger.kernel.org>; Mon, 14 Apr 2025 01:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744620430; x=1745225230; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zkv7euVv/iX/9hXEjI6XJWW/gjwtkpbxGQeyKEYrs60=;
        b=ncPOYfzic4T1Y1uXrgFMM5Yxsv1PyDXLEN6iwgSvOKlWu1KfJ07NzVwr0dMl+XPO6K
         7I5aA9vIzOCP847x4Q6IClgnvOk1jPMQRBrrF7UdhaTeWJtAkxG9U9/T3ddYAY9fqV/D
         6foewg8lqA+3Mhy0Va/j+MDHFisElHpzQH8E8zNWV3eyTwtROwzVFdvnn0F7GzU0tjE/
         oEgmbF7ioRPODUc0sIzCxhLbGv44qhjszbDYGTWoTovUu1nuOAEYo+FiezLvukdMCB8Z
         lA8Rm3nhRyGoef12C6+Gd5V3yOGXza6f8bkmFfJANq/EwRPCWat+OChGF3j4dSqG6EXD
         HQPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744620430; x=1745225230;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zkv7euVv/iX/9hXEjI6XJWW/gjwtkpbxGQeyKEYrs60=;
        b=hFju0h6xgL+JeOKoLshjYOO8cLf0rNz8qwdBTjOmeVR3TMWlK+jjOaNkvmGAPf74cw
         uZ6BEFHMQ2fonq8X44JO9qDYZ7IMRmmimlyuFkkyuXp6v4/dNmAhMZN7MEt2WduXjWd7
         +nkhVkq8j3n1duMqfFkqenQvw6XltxGY/EjXhXExTGrMxyUC22Sc0cZWLHQtQdviKBa0
         9U9xPc45fYcraOmA24/WaeAcUVfLAT+He3ib6NCVK9mR8BopOGKN/EHoRjwjYPh52Y7u
         RM7B9s5813nwima3Y0uwSgSFI27IhV5dzdrVdFCmto1Z1UFPJFvknzB1ApLdgbSHc6bv
         kMYA==
X-Forwarded-Encrypted: i=1; AJvYcCXxvDHVtOJkeALRkLnqdjnLNHkzLyN5vuvknK0rrtViwbePyWIuVRZzQxQ2+Xm2qSm+IO5XK+vcaW0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxmy0YYN9CwU2zFS0A+6BHsqC5y77EexqxVIqMEdklDgjA97HqJ
	eKlB+y0wE2rY3a1WuBq38AZ6l4G05dZ0ZKG10IDsnPsOJWFGI7Ns//qXcH5VLwg=
X-Gm-Gg: ASbGnct8qnz1zf7Ccl87f85E92NtZqDTlOVqvUuOlDnwXJlTLxy8PE62JzNcNiKqT6X
	JUWDZH+d3axyCncthaSrr/hExgqPpJunPTQKcngVmPRZzD58Q9ZMEKDoMZfPJcna78D+o+++s2G
	cFhHmpYLC7UOp/X+CByCsDkIsmeuMCQZLMzJIS+dPPXO2i61DyShvEu/lWuoXcu9KKMhUYtvVRh
	swt8JErZ7m4jZN5r1idDq4ZTXHBtCK4G30pmciCOul9vk9SNgvzp4M7oG5HjrAOVZXOlGH0Rft5
	tH1yZhClZRHkavX4T/NfqZxyMMpEHmjv21So6GezIy+g9o96MSr5
X-Google-Smtp-Source: AGHT+IH35ZTJP+V0RvnpNPl/28vP29Y3UWwcZRRDzW+LiFsJ1uIUU04GVV6dodGySfzWIThp5nJ6Zw==
X-Received: by 2002:a17:902:ce87:b0:224:10a2:cad5 with SMTP id d9443c01a7336-22bea49487bmr181436035ad.10.1744620429791;
        Mon, 14 Apr 2025 01:47:09 -0700 (PDT)
Received: from localhost ([122.172.83.32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7b62ba5sm94222205ad.14.2025.04.14.01.47.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 01:47:09 -0700 (PDT)
Date: Mon, 14 Apr 2025 14:17:06 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Danilo Krummrich <dakr@redhat.com>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	linux-pm@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Stephen Boyd <sboyd@kernel.org>, Nishanth Menon <nm@ti.com>,
	rust-for-linux@vger.kernel.org,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Erik Schilling <erik.schilling@linaro.org>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Joakim Bech <joakim.bech@linaro.org>, Rob Herring <robh@kernel.org>,
	Yury Norov <yury.norov@gmail.com>, Burak Emir <bqe@google.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Russell King <linux@armlinux.org.uk>, linux-clk@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V9 15/17] rust: cpufreq: Extend abstractions for driver
 registration
Message-ID: <20250414084706.rjsdaoxmug4p4e7l@vireshk-i7>
References: <cover.1744366571.git.viresh.kumar@linaro.org>
 <2f7a1331ad513b94fb47c05bf1d0f5c3fa803858.1744366572.git.viresh.kumar@linaro.org>
 <Z_kD5G3WhcYlgqmr@cassiopeiae>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z_kD5G3WhcYlgqmr@cassiopeiae>

On 11-04-25, 13:58, Danilo Krummrich wrote:
> On Fri, Apr 11, 2025 at 04:25:14PM +0530, Viresh Kumar wrote:
> > +impl<T: Driver> Registration<T> {
> > +    /// Registers a CPU frequency driver with the cpufreq core.
> > +    pub fn new(name: &'static CStr, data: T::Data, flags: u16, boost: bool) -> Result<Self> {
> 
> Do you really need the private data? It seems to be used by only very few
> drivers in C either.

Yes, only a few of them are setting it to a value other than `pdev`.
Maybe we can avoid it for the time being and come back to this when a
driver really wants it.

> If no, it seems to me that you can even avoid allocating a struct cpufreq_driver
> dynamically and make it const instead.

I am not sure if I understood your suggestion. The Registration::new()
method still updates the instance of cpufreq_driver before passing it
to the C cpufreq core.

I have tried to fix the other issues though.

-- 
viresh

diff --git a/drivers/cpufreq/rcpufreq_dt.rs b/drivers/cpufreq/rcpufreq_dt.rs
index 751be33c0218..831269bdeabf 100644
--- a/drivers/cpufreq/rcpufreq_dt.rs
+++ b/drivers/cpufreq/rcpufreq_dt.rs
@@ -59,7 +59,10 @@ impl opp::ConfigOps for CPUFreqDTDriver {}
 
 #[vtable]
 impl cpufreq::Driver for CPUFreqDTDriver {
-    type Data = ();
+    const NAME: &CStr = c_str!("cpufreq-dt");
+    const FLAGS: u16 = cpufreq::flags::NEED_INITIAL_FREQ_CHECK | cpufreq::flags::IS_COOLING_DEV;
+    const BOOST_ENABLED: bool = true;
+
     type PData = Arc<CPUFreqDTDevice>;
 
     fn init(policy: &mut cpufreq::Policy) -> Result<Self::PData> {
@@ -213,13 +216,7 @@ fn probe(
         pdev: &platform::Device<Core>,
         _id_info: Option<&Self::IdInfo>,
     ) -> Result<Pin<KBox<Self>>> {
-        cpufreq::Registration::<CPUFreqDTDriver>::new_foreign_owned(
-            pdev.as_ref(),
-            c_str!("cpufreq-dt"),
-            (),
-            cpufreq::flags::NEED_INITIAL_FREQ_CHECK | cpufreq::flags::IS_COOLING_DEV,
-            true,
-        )?;
+        cpufreq::Registration::<CPUFreqDTDriver>::new_foreign_owned(pdev.as_ref())?;
 
         let drvdata = KBox::new(Self {}, GFP_KERNEL)?;
 
diff --git a/rust/kernel/cpufreq.rs b/rust/kernel/cpufreq.rs
index 4194b9558413..9b275d4d3eb6 100644
--- a/rust/kernel/cpufreq.rs
+++ b/rust/kernel/cpufreq.rs
@@ -685,13 +685,14 @@ fn drop(&mut self) {
 /// Reference: <https://docs.kernel.org/cpu-freq/cpu-drivers.html>
 #[vtable]
 pub trait Driver {
-    /// Driver specific data.
-    ///
-    /// Corresponds to the data retrieved via the kernel's `cpufreq_get_driver_data` function.
-    ///
-    /// Require `Data` to implement `ForeignOwnable`. We guarantee to never move the underlying
-    /// wrapped data structure.
-    type Data: ForeignOwnable;
+    /// Driver's name.
+    const NAME: &'static CStr;
+
+    /// Driver's flags.
+    const FLAGS: u16;
+
+    /// Boost support.
+    const BOOST_ENABLED: bool;
 
     /// Policy specific data.
     ///
@@ -804,8 +805,8 @@ fn register_em(_policy: &mut Policy) {
 ///
 /// ```
 /// use kernel::{
-///     c_str,
 ///     cpu, cpufreq,
+///     c_str,
 ///     device::Device,
 ///     macros::vtable,
 ///     sync::Arc,
@@ -817,7 +818,10 @@ fn register_em(_policy: &mut Policy) {
 ///
 /// #[vtable]
 /// impl cpufreq::Driver for FooDriver {
-///     type Data = ();
+///     const NAME: &'static CStr = c_str!("cpufreq-foo");
+///     const FLAGS: u16 = cpufreq::flags::NEED_INITIAL_FREQ_CHECK | cpufreq::flags::IS_COOLING_DEV;
+///     const BOOST_ENABLED: bool = true;
+///
 ///     type PData = Arc<FooDevice>;
 ///
 ///     fn init(policy: &mut cpufreq::Policy) -> Result<Self::PData> {
@@ -848,13 +852,7 @@ fn register_em(_policy: &mut Policy) {
 /// }
 ///
 /// fn foo_probe(dev: &Device) {
-///     cpufreq::Registration::<FooDriver>::new_foreign_owned(
-///         dev,
-///         c_str!("cpufreq-foo"),
-///         (),
-///         cpufreq::flags::NEED_INITIAL_FREQ_CHECK | cpufreq::flags::IS_COOLING_DEV,
-///         true,
-///     ).unwrap();
+///     cpufreq::Registration::<FooDriver>::new_foreign_owned(dev).unwrap();
 /// }
 /// ```
 pub struct Registration<T: Driver> {
@@ -868,13 +866,12 @@ unsafe impl<T: Driver> Sync for Registration<T> {}
 
 #[allow(clippy::non_send_fields_in_send_ty)]
 // SAFETY: Registration with and unregistration from the cpufreq subsystem can happen from any
-// thread.  Additionally, `T::Data` (which is dropped during unregistration) is `Send`, so it is
-// okay to move `Registration` to different threads.
+// thread.
 unsafe impl<T: Driver> Send for Registration<T> {}
 
 impl<T: Driver> Registration<T> {
     /// Registers a CPU frequency driver with the cpufreq core.
-    pub fn new(name: &'static CStr, data: T::Data, flags: u16, boost: bool) -> Result<Self> {
+    pub fn new() -> Result<Self> {
         // Required due to Rust 1.82's stricter handling of `unsafe` in mutable statics. The
         // `unsafe` blocks aren't required anymore with later versions.
         #![allow(unused_unsafe)]
@@ -886,18 +883,18 @@ pub fn new(name: &'static CStr, data: T::Data, flags: u16, boost: bool) -> Resul
         let drv_ref = drv.get_mut();
 
         // Account for the trailing null byte.
-        let len = name.len() + 1;
+        let len = T::NAME.len() + 1;
         if len > drv_ref.name.len() {
             return Err(EINVAL);
         };
 
-        // SAFETY: `name` is a valid `CStr`, and we are copying it to an array of equal or larger
-        // size.
-        let name = unsafe { &*(name.as_bytes_with_nul() as *const [u8]) };
+        // SAFETY: `T::NAME` is a valid `CStr`, and we are copying it to an array of equal or
+        // larger size.
+        let name = unsafe { &*(T::NAME.as_bytes_with_nul() as *const [u8]) };
         drv_ref.name[..len].copy_from_slice(name);
 
-        drv_ref.boost_enabled = boost;
-        drv_ref.flags = flags;
+        drv_ref.boost_enabled = T::BOOST_ENABLED;
+        drv_ref.flags = T::FLAGS;
 
         // Initialize mandatory callbacks.
         drv_ref.init = Some(Self::init_callback);
@@ -995,10 +992,6 @@ pub fn new(name: &'static CStr, data: T::Data, flags: u16, boost: bool) -> Resul
             None
         };
 
-        // Set driver data before registering the driver, as the cpufreq core calls few callbacks
-        // before `cpufreq_register_driver` returns.
-        Self::set_data(drv_ref, data)?;
-
         // SAFETY: It is safe to register the driver with the cpufreq core in the kernel C code.
         to_result(unsafe { bindings::cpufreq_register_driver(drv_ref) })?;
 
@@ -1012,53 +1005,10 @@ pub fn new(name: &'static CStr, data: T::Data, flags: u16, boost: bool) -> Resul
     ///
     /// Instead the [`Registration`] is owned by [`Devres`] and will be revoked / dropped, once the
     /// device is detached.
-    pub fn new_foreign_owned(
-        dev: &Device,
-        name: &'static CStr,
-        data: T::Data,
-        flags: u16,
-        boost: bool,
-    ) -> Result<()> {
-        Devres::new_foreign_owned(dev, Self::new(name, data, flags, boost)?, GFP_KERNEL)?;
+    pub fn new_foreign_owned(dev: &Device) -> Result<()> {
+        Devres::new_foreign_owned(dev, Self::new()?, GFP_KERNEL)?;
         Ok(())
     }
-
-    // Sets the `Data` for the CPU frequency driver.
-    fn set_data(drv: &mut bindings::cpufreq_driver, data: T::Data) -> Result<()> {
-        if drv.driver_data.is_null() {
-            // Transfer the ownership of the data to the C code.
-            drv.driver_data = <T::Data as ForeignOwnable>::into_foreign(data) as _;
-            Ok(())
-        } else {
-            Err(EBUSY)
-        }
-    }
-
-    /// Returns borrowed `Data` previously set for the CPU frequency driver.
-    pub fn data(&mut self) -> Option<<T::Data as ForeignOwnable>::Borrowed<'static>> {
-        let drv = self.drv.get_mut();
-
-        if drv.driver_data.is_null() {
-            None
-        } else {
-            // SAFETY: The data is earlier set by us from `set_data`.
-            Some(unsafe { <T::Data as ForeignOwnable>::borrow(drv.driver_data) })
-        }
-    }
-
-    // Clears and returns the `Data` for the CPU frequency driver.
-    fn clear_data(&mut self) -> Option<T::Data> {
-        let drv = self.drv.get_mut();
-
-        if drv.driver_data.is_null() {
-            None
-        } else {
-            // SAFETY: The data is earlier set by us from `set_data`.
-            let data = Some(unsafe { <T::Data as ForeignOwnable>::from_foreign(drv.driver_data) });
-            drv.driver_data = ptr::null_mut();
-            data
-        }
-    }
 }
 
 // CPU frequency driver callbacks.
@@ -1313,8 +1263,5 @@ fn drop(&mut self) {
 
         // SAFETY: The driver was earlier registered from `new`.
         unsafe { bindings::cpufreq_unregister_driver(drv) };
-
-        // Free data
-        drop(self.clear_data());
     }
 }

